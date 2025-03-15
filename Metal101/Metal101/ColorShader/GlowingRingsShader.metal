//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

// https://iquilezles.org/articles/palettes/
half3 colorPalette(float t) {
    half3 a = half3(0.5, 0.5, 0.5);
    half3 b = half3(0.5, 0.5, 0.5);
    half3 c = half3(1.0, 1.0, 1.0);
    half3 d = half3(0.263, 0.416, 0.557);
    return a + b * cos(M_PI_H * 2 * (c * t + d));
}

[[ stitchable ]] half4 GlowingRings(float2 position, half4 color, float2 size, float time) {
//    float2 uv = position / size;
//    uv -= 0.5;
//    uv *= 2;
//    uv.x *= size.x / size.y;
    float2 uv = (position * 2 - size) / size.y;

    float d = length(uv);
//    half3 result = half3(d);
    half3 result = colorPalette(d);
//    half3 result = colorPalette(d + time);

    d = sin(d * 8 + time) / 8;
    d = abs(d);
    d = 0.02 / d;



    result *= d;


    return half4(result, 1);
}
