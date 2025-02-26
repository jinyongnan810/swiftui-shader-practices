//
//  GrayScaleShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 grayScale(float2 position, half4 color, float4 weights) {
    half brightness = weights[0] * color.r + weights[1] * color.g + weights[2] * color.b;
//    half brightness = dot(weights, color);
    // return half4(brightness, brightness, 0.3, 1);
    return half4(brightness, brightness, brightness, 1);
}

