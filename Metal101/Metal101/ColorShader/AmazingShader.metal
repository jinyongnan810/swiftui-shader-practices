//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//
// from https://www.shadertoy.com/view/mtyGWy
// ref: https://www.youtube.com/watch?v=f4s1h2YETNY
#include <metal_stdlib>
using namespace metal;
half3 palette(float time) {
    half3 a = half3(0.5, 0.5, 0.5);
    half3 b = half3(0.5, 0.5, 0.5);
    half3 c = half3(1, 1, 1);
    half3 d = half3(0.263, 0.416, 0.557);
    return a + b * cos(M_PI_H * 2 * (c * time + d));
}

[[ stitchable ]] half4 AmazingShader(float2 position, half4 color, float2 size, float time) {
    float2 uv = (position * 2 - size) / size.y;
    float2 uv0 = uv;
    half3 result = half3(0);
    for(int i = 0; i<4; i++) {
        uv = fract(uv * 1.5) - 0.5;
        float d = length(uv) * exp(-length(uv0));
        half3 col = palette(length(uv0) + i * 0.4 + time * 0.4);
        d = sin(d * 8 + time)/8;
        d = abs(d);
        d = pow(0.01 / d, 1.2);

        result += col * d;
    }

    return mix(half4(result, 1), color, 0.5);
}
