# DistortionShader

This folder contains Metal distortion shaders that modify pixel positions without directly changing colors. Distortion shaders use `distortionEffect()` modifier in SwiftUI.

## Shader Signature

```metal
[[ stitchable ]] float2 shaderName(float2 position, ...)
```

- `position`: Current pixel position being evaluated
- Returns: New position (`float2`) to sample color from

The shader returns where to sample the original image, not where to move pixels to.

---

## Shaders

### Tile Effect
Creates a tiled/repeated version of the content.

**Techniques:**
- `fmod()` for wrapping coordinates: `fmod(position * tile, size)`
- Configurable columns and rows
- Position multiplication for scaling

**SwiftUI Integration:**
```swift
.distortionEffect(ShaderLibrary.TileEffect(
    .float2(proxy.size),
    .float2(columns, rows)
), maxSampleOffset: .zero)
```

**Key Parameters:**
- `size`: Original content size
- `tile`: Number of tiles (columns, rows)

---

### Angle Effect
Displaces the entire content in a direction based on angle and force.

**Techniques:**
- Trigonometric displacement: `float2(cos(angle), sin(angle)) * force`
- Directional movement using angle in radians
- Subtractive displacement: `position - displacement`

**SwiftUI Integration:**
```swift
.distortionEffect(ShaderLibrary.AngleEffect(
    .float2(proxy.size),
    .float(angleInRadians),
    .float(force)
), maxSampleOffset: .zero)
```

**Key Parameters:**
- `angle`: Direction in radians (0 to 2*PI)
- `force`: Displacement magnitude (positive or negative)

---

## Common Patterns

### Using distortionEffect
```swift
.visualEffect { content, proxy in
    content.distortionEffect(
        ShaderLibrary.shader(.float2(proxy.size)),
        maxSampleOffset: .zero  // or CGSize for larger offsets
    )
}
```

### maxSampleOffset
- `.zero` when pixels only sample from their original location or nearby
- Use larger values when pixels may sample from far away positions
- Affects rendering performance and clipping behavior

### Position vs Displacement
```metal
// Displacement: where the pixel appears to move TO
float2 displacement = float2(10, 0);
return position - displacement;  // Shifts content right

// Direct: where to sample FROM
return position + offset;  // Shifts content left
```

---

## Tips

1. **Coordinate System**: Origin (0, 0) is typically top-left
2. **Aspect Ratio**: Consider `size.x / size.y` for uniform effects
3. **Animation**: Combine with `TimelineView` for animated distortions
4. **Performance**: Distortion effects can be computationally expensive
