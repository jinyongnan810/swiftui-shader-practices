//
//  SwizzleShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/25.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 Swizzle1(float2 position, half4 color) {
    half4 result = color.rgba;
    return result;
}

[[ stitchable ]] half4 Swizzle2(float2 position, half4 color) {
    half4 result = color.grba;
    return result;
}

[[ stitchable ]] half4 Swizzle3(float2 position, half4 color) {
    half4 result = color.rrra;
    return result;
}

[[ stitchable ]] half4 Swizzle4(float2 position, half4 color) {
    half4 result = color.ggra;
    return result;
}

[[ stitchable ]] half4 Swizzle5(float2 position, half4 color) {
    half4 result = color.yyzw;
    return result;
}

[[ stitchable ]] half4 Swizzle6(float2 position, half4 color) {
    half4 result = half4(color.rg,0,1);
    return result;
}

[[ stitchable ]] half4 Swizzle7(float2 position, half4 color) {
    half4 result = color;
    result.rg = half(1);
    return result;
}
