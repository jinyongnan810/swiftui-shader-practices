//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

float random(float2 uv) {
    return fract(sin(dot(uv, float2(12.9898,78.233)))*43758.5453123);
}


[[ stitchable ]] half4 GrainyEffect(float2 position, half4 color, float2 size, float time) {
    float2 uv = position / size;
    float randomValue = random(uv + time);
    half4 noise = half4(half3(randomValue), 0.8);
    half4 result = noise * color;
    return result;
}
