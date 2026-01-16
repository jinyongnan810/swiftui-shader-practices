# LayerShader

This folder contains Metal layer shaders that can sample from any position in the rendered layer. Layer shaders use `layerEffect()` modifier in SwiftUI and have access to the full rendered content via `SwiftUI::Layer`.

## Shader Signature

```metal
#include <SwiftUI/SwiftUI.h>

[[ stitchable ]] half4 shaderName(
    float2 position,
    SwiftUI::Layer layer,
    ...
)
```

- `position`: Current pixel position being evaluated
- `layer`: The rendered SwiftUI layer (can sample from any position)
- Returns: Final color as `half4`

---

## Shaders

### Ripple Effect
Creates an interactive water ripple effect emanating from a touch point.

**Source:** Apple's official SwiftUI documentation example

**Techniques:**
- `layer.sample(newPosition)` to read pixels from offset positions
- Wave physics: `amplitude * sin(frequency * time) * exp(-decay * time)`
- Delay calculation based on distance from origin
- Direction vector: `normalize(position - origin)`
- Color adjustment based on ripple displacement

**Metal Implementation:**
```metal
// Calculate ripple displacement
float distance = length(position - origin);
float delay = distance / speed;
time = max(0.0, time - delay);

float rippleAmount = amplitude * sin(frequency * time) * exp(-decay * time);
float2 n = normalize(position - origin);
float2 newPosition = position + rippleAmount * n;

// Sample and adjust color
half4 color = layer.sample(newPosition);
color.rgb += 0.3 * (rippleAmount / amplitude) * color.a;
```

**Parameters:**
- `origin`: Touch/tap point (in view coordinates)
- `time`: Elapsed time since trigger
- `amplitude`: Wave height (default: 12)
- `frequency`: Wave frequency (default: 15)
- `decay`: How quickly waves fade (default: 8)
- `speed`: Wave propagation speed (default: 2000)

---

## SwiftUI Integration

### Using layerEffect
```swift
content.layerEffect(
    shader,
    maxSampleOffset: CGSize(width: amplitude, height: amplitude),
    isEnabled: elapsedTime > 0 && elapsedTime < duration
)
```

### Keyframe Animation Pattern
```swift
content.keyframeAnimator(
    initialValue: 0,
    trigger: trigger
) { view, elapsedTime in
    view.modifier(RippleModifier(
        origin: origin,
        elapsedTime: elapsedTime,
        duration: duration
    ))
} keyframes: { _ in
    MoveKeyframe(0)
    LinearKeyframe(duration, duration: duration)
}
```

### Custom Gesture Handling
The example includes a custom `SpatialPressingGesture` using `UIGestureRecognizerRepresentable`:
- Captures touch location on press
- Uses `UILongPressGestureRecognizer` with zero minimum duration
- Supports simultaneous gesture recognition

---

## Key Differences from Other Shader Types

| Feature | colorEffect | distortionEffect | layerEffect |
|---------|-------------|------------------|-------------|
| Input | position, color | position | position, layer |
| Output | half4 (color) | float2 (position) | half4 (color) |
| Can sample elsewhere | No | Implicit | Yes (explicit) |
| Use case | Color manipulation | Position warping | Complex effects |

---

## Tips

1. **maxSampleOffset**: Must cover the maximum distance pixels will be displaced
2. **Performance**: Layer effects are more expensive since they require the full layer to be rendered first
3. **isEnabled**: Use to disable effect when not animating to save resources
4. **Layer Sampling**: `layer.sample()` returns `half4` with premultiplied alpha
5. **Coordinate Space**: Position is in the view's coordinate space

---

## References

- [Apple Documentation: Creating Visual Effects with SwiftUI](https://developer.apple.com/documentation/SwiftUI/Creating-visual-effects-with-SwiftUI)
