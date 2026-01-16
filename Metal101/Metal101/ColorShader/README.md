# ColorShader

This folder contains Metal color shaders that modify pixel colors without changing positions. Color shaders use `colorEffect()` modifier in SwiftUI.

## Shader Signature

```metal
[[ stitchable ]] half4 shaderName(float2 position, half4 color, ...)
```

- `position`: Current pixel position
- `color`: Original pixel color (RGBA)
- Returns: New color as `half4`

---

## Shaders

### GrayScale
Converts image to grayscale using configurable RGB weights.

**Techniques:**
- Weighted luminance calculation: `brightness = r*wr + g*wg + b*wb`
- Passing `float4` weights from SwiftUI
- Standard luma coefficients (Rec.601, Rec.709)

**SwiftUI Integration:**
- Uses SwiftData to persist custom weight presets

---

### UV Shader
Demonstrates UV coordinate manipulation and color mixing.

**Techniques:**
- UV normalization: `uv = position / size`
- `mix()` function for blending colors
- Swizzling: `color.gbra`, `half2(uv)`
- Using `visualEffect` modifier to access `proxy.size`

---

### Center Effect (Animating)
Creates animated concentric rings from the center.

**Techniques:**
- Distance calculation: `metal::distance(center, position)`
- Time-based animation with `sin(time)`, `cos(time)`
- Conditional coloring based on distance thresholds
- `TimelineView(.animation)` for continuous updates

---

### Swizzle
Demonstrates Metal's swizzling syntax for reordering color channels.

**Techniques:**
- RGBA swizzling: `.grba`, `.rrra`, `.ggra`
- XYZW alternative syntax: `.yyzw`
- Partial swizzle assignment: `result.rg = half(1)`
- Component extraction: `half4(color.rg, 0, 1)`

---

### Grainy Effect
Adds animated film grain/noise overlay.

**Techniques:**
- Pseudo-random function: `fract(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453123)`
- Time-based noise variation for animation
- Multiplicative noise blending

**SwiftUI Integration:**
- Reusable `GrainyView` wrapper with `@ViewBuilder`

---

### Opacity Zero Circle
Creates a circular spotlight effect following touch position.

**Techniques:**
- Touch-based interaction via `DragGesture`
- Distance-based opacity falloff: `1 - rate * rate`
- Passing touch position as `float2`

---

### SmoothStep Function
Visualizes the `smoothstep()` function as a graph.

**Techniques:**
- `smoothstep(edge0, edge1, x)` for smooth interpolation
- Plot function using subtracted smoothsteps for line thickness
- Configurable bending position and line width

---

### Split Color
Splits image into two color-tinted halves.

**Techniques:**
- Branch-free conditional: `smoothstep()` as mask vs `if` statement
- `mix()` for smooth transition between colors
- UV-based horizontal split

---

### Glowing Effect
Creates a glowing circle with adjustable intensity.

**Techniques:**
- Aspect ratio correction: `uv.x *= size.x / size.y`
- `step()` for hard edges
- Glow formula: `0.01 / (distance - threshold)`
- `clamp()` to limit glow intensity

---

### Stripe Colors
Creates repeating vertical color stripes.

**Techniques:**
- `fmod()` for repeating patterns
- Index-based color selection
- Both color effect and fill shader variants
- Using shader for `foregroundStyle()` and `border()`

---

### Inspirational Shader
Complex animated pattern with light rays.

**Techniques:**
- Multi-pass rendering with loop (`for i in 0..<3`)
- UV distortion using trigonometric functions
- Per-channel color calculation
- `fmod()` for repeating patterns

---

### Lava Lamp
Simulates metaball/lava lamp blobs.

**Techniques:**
- Multiple blob centers with oscillating positions
- Influence field calculation: `strength / distance`
- Threshold-based blob rendering
- `pow(sin(...), 2)` for smooth oscillation

---

### Voronoi Shader
Creates animated Voronoi cells with distinct colors.

**Techniques:**
- Constant arrays for point positions and colors
- Nearest-neighbor search for cell assignment
- Animated point positions with sin/cos oscillation
- Dot rendering at cell centers

---

### Amazing Shader
Fractal-like animated pattern (from Shadertoy).

**Techniques:**
- Cosine color palette: `a + b * cos(2*PI*(c*t + d))`
- `fract()` for fractal repetition
- `exp(-length(uv0))` for distance-based attenuation
- Multi-iteration accumulation
- Reference: https://www.shadertoy.com/view/mtyGWy

---

### Fractal Brownian Motion (FBM)
Creates animated aurora-like flowing lines.

**Techniques:**
- Hash function for pseudo-random values
- 2D noise function with bilinear interpolation
- FBM: layered noise with rotation matrix
- Multi-line rendering with different parameters
- `.boundingRect` for shader bounds
- Text masking with shaders

---

### Glowing Rings
Animated concentric glowing rings.

**Techniques:**
- Cosine color palette (Inigo Quilez technique)
- Radial sine wave: `sin(d * 8 + time)`
- Inverse distance glow: `0.02 / abs(d)`
- Reference: https://iquilezles.org/articles/palettes/

---

### Infrared Effect
Converts image to thermal/infrared color mapping.

**Techniques:**
- Luminance calculation with perceptual weights
- Three-point color gradient (cold/medium/hot)
- Conditional color mapping based on luma threshold
- Alpha preservation for transparent pixels
- Reference: Adapted from Inferno shader library

---

## Common Patterns

### Passing Size to Shaders
```swift
.visualEffect { content, proxy in
    content.colorEffect(ShaderLibrary.shader(.float2(proxy.size)))
}
```

### Animation with TimelineView
```swift
TimelineView(.animation) { _ in
    content.colorEffect(ShaderLibrary.shader(.float(date.timeIntervalSinceNow)))
}
```

### UV Normalization
```metal
float2 uv = position / size;        // 0 to 1
float2 uv = (position * 2 - size) / size.y;  // -1 to 1, aspect corrected
```
