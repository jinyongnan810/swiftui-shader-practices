# Exploring SwiftUI Shaders with Metal

A collection of Metal shader examples for SwiftUI, demonstrating various visual effects and techniques.

## Project Structure

```
Metal101/Metal101/
├── ColorShader/      # Pixel color manipulation shaders
├── DistortionShader/ # Position-based distortion effects
└── LayerShader/      # Full layer sampling effects
```

Each folder contains its own README with detailed documentation of techniques and tips.

## Shader Types

| Type | SwiftUI Modifier | Description |
|------|------------------|-------------|
| Color | `.colorEffect()` | Modify pixel colors based on position |
| Distortion | `.distortionEffect()` | Warp/displace pixel positions |
| Layer | `.layerEffect()` | Sample from any position in the layer |

---

## Shader Gallery

### Color Effects

| Effect | Preview |
|--------|---------|
| [Grainy Effect](Metal101/Metal101/ColorShader/GrainyEffectShader.metal) - Film grain overlay | ![grainy](https://github.com/user-attachments/assets/eb8c4306-03f5-4834-9c35-7f480f0816fc) |
| [Lava Lamp / Blob](Metal101/Metal101/ColorShader/LavaLampShader.metal) - Metaball simulation | ![blob](https://github.com/user-attachments/assets/101ef514-bdef-448f-8723-6d7babdba307) |
| [Voronoi](Metal101/Metal101/ColorShader/VoronoiShader.metal) - Animated cell patterns | ![voronoi](https://github.com/user-attachments/assets/45666537-24ec-4085-90c7-c205cb14ec81) |
| [Fractal Brownian Motion](Metal101/Metal101/ColorShader/Fractal%20Brownian%20Motion%20Shader.metal) - Aurora-like lines | ![brownian motion](https://github.com/user-attachments/assets/d7e8d21b-6e02-4cda-9aa4-ec0e7259c0f5) |
| [Inspirational](Metal101/Metal101/ColorShader/InspirationalShader.metal) - Light ray patterns | ![inspiration](https://github.com/user-attachments/assets/6bdfe0e7-2478-4bd6-9141-3863be577a57) |
| [SmoothStep Plot](Metal101/Metal101/ColorShader/SmoothStepFunctionShader.metal) - Function visualization | ![function plot](https://github.com/user-attachments/assets/04113aae-6229-46b3-a829-1f9e02bfac32) |
| [Glowing Rings](Metal101/Metal101/ColorShader/GlowingRingsShader.metal) - Animated concentric rings | ![glowing rings](https://github.com/user-attachments/assets/f445e42a-51fb-4c94-a9b8-1104d0ae9a1a) |
| [Color Stripes](Metal101/Metal101/ColorShader/StripeColorsShader.metal) - Repeating stripe pattern | ![color stripes](https://github.com/user-attachments/assets/85816494-aee2-4750-b0b0-1e94b13e7f94) |
| [Amazing Shader](Metal101/Metal101/ColorShader/AmazingShader.metal) - Fractal color effect | ![amazing](https://github.com/user-attachments/assets/b2228f4b-11da-460f-aabd-20eed994a2b7) |
| [Infrared](Metal101/Metal101/ColorShader/InfaredEffectShader.metal) - Thermal camera effect | |

### Distortion Effects

| Effect | Preview |
|--------|---------|
| [Tile](Metal101/Metal101/DistortionShader/TileShader.metal) - Repeating tile pattern | ![tile](https://github.com/user-attachments/assets/dfe0b470-be00-42bc-a0ce-0e18c48a4fa5) |
| [Angle](Metal101/Metal101/DistortionShader/AngleShader.metal) - Directional displacement | |

### Layer Effects

| Effect | Preview |
|--------|---------|
| [Ripple Tap](Metal101/Metal101/LayerShader/RippleTapEffect.metal) - Interactive water ripple | ![ripple](https://github.com/user-attachments/assets/be1c48ab-975e-4cfa-a51b-feb44f1d75f5) |

---

## Key Techniques

- **UV Normalization**: `float2 uv = position / size`
- **Aspect Ratio Correction**: `uv.x *= size.x / size.y`
- **Animation**: `TimelineView(.animation)` + `date.timeIntervalSinceNow`
- **Pseudo-random**: `fract(sin(dot(uv, float2(12.9898, 78.233))) * 43758.5453)`
- **Color Palettes**: Cosine gradients from [Inigo Quilez](https://iquilezles.org/articles/palettes/)

## Resources

- [Apple: Creating Visual Effects with SwiftUI](https://developer.apple.com/documentation/SwiftUI/Creating-visual-effects-with-SwiftUI)
- [Shadertoy](https://www.shadertoy.com/) - Shader inspiration
- [The Book of Shaders](https://thebookofshaders.com/) - Learning resource

