#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 DotIndicatorShader(float2 position, half4 color, float2 size, float time) {
    // Centered UV with aspect correction.
    float2 uv = position / size;
    float2 p = uv - 0.5;
    p.x *= size.x / size.y;

    float r = max(length(p), 1e-5);
    float a = atan2(p.y, p.x);
    float rotatedAngle = a - time * 0.1;

    half3 baseColor = color.rgb;

    // Subtle life, but not too "animated".
    float pulse = 0.96 + 0.04 * sin(time * 2.2);
    float shimmer = 0.94 + 0.06 * sin(time * 7.0 + rotatedAngle * 6.0 + r * 24.0);

    // Very small hot center.
    float core = exp(-pow(r / 0.020, 2.0) * 1.8);

    // Tight glow around the dot.
    float innerGlow = exp(-pow(r / 0.055, 2.0) * 1.5);

    // Wider soft halo.
    float halo = exp(-pow(r / 0.16, 2.0) * 1.15);

    // Rays from angular lobes instead of explicit line primitives.
    // Major rays: horizontal + vertical
    float majorAngular = pow(abs(cos(rotatedAngle * 2.0)), 34.0);

    // Minor rays: diagonals, dimmer and thinner
    float minorAngular = pow(abs(cos(rotatedAngle * 2.0 + 0.78539816339)), 56.0);

    // Rays taper naturally with distance.
    float majorLength = 10.5 + 0.9 * sin(time * 3);
    float minorLength = 13.5 + 1.2 * sin(time * 3);
    float majorRay = majorAngular * exp(-r * majorLength) * smoothstep(0.012, 0.08, r);
    float minorRay = minorAngular * exp(-r * minorLength) * smoothstep(0.010, 0.06, r);

    float rays = (majorRay * 0.95 + minorRay * 0.42) * pulse * shimmer;

    // Combine brightness layers.
    float brightness = core * 1.35 + innerGlow * 0.75 + halo * 0.22 + rays * 0.95;
    brightness = clamp(brightness, 0.0, 1.0);

    // Color treatment:
    // - keep your tint in the body
    // - push center/rays toward warm white
    half3 warmWhite = half3(1.0, 0.96, 0.90);

    half3 rgb = baseColor * half(innerGlow * 0.95 + halo * 0.35);
    rgb += warmWhite * half(core * 0.95 + rays * 0.48);
    rgb = mix(rgb, half3(1.0), half(clamp(core * 0.9, 0.0, 1.0)));
    rgb = clamp(rgb, half3(0.0), half3(1.0));

    // Keep outer halo faint so it feels luminous, not foggy.
    float alpha = core * 0.95 + innerGlow * 0.42 + halo * 0.12 + rays * 0.55;
    alpha = clamp(alpha, 0.0, 1.0) * color.a;

    return half4(rgb, half(alpha));
}
