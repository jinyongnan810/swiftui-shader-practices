//
//  UVShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 colorShaderWithPosition1(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
    half4 result = half4(uv.x, uv.y, color.b, 1);
    return result;
}

[[ stitchable ]] half4 colorShaderWithPosition2(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
    half4 result = half4((uv.x + color.r) / 2, (uv.y + color.g) / 2, color.b, 1);
    return result;
}

[[ stitchable ]] half4 colorShaderWithPosition3(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
    half4 result = half4((uv.x + color.r) / 2, (uv.y + color.g) / 2, color.b, abs(uv.x-0.5) + abs(uv.y-0.5));
    return result;
}

[[ stitchable ]] half4 colorShaderWithPosition4(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
//    half4 result = half4(color.g * uv.x, color.b * uv.y, color.r, 1);
    half4 result = half4(half2(uv),1,1) * color.gbra;
    return result;
}

[[ stitchable ]] half4 colorShaderWithPosition5(float2 position, half4 color, float2 size) {
    float2 uv = position / size;
    half4 newColor = half4(half2(uv), 0.6, 1);
    half4 result = mix(color, newColor, half4(0.66));
    return result;
}
