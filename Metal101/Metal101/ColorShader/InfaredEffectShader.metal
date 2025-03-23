//
//  InfaredEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/03/23.
//

#include <metal_stdlib>
using namespace metal;

// Original from: https://github.com/twostraws/Inferno/blob/main/Sources/Inferno/Shaders/Transformation/Infrared.metal

constant half3 cold = half3(0.0h, 0.0h, 1.0h);
constant half3 medium = half3(1.0h, 1.0h, 0.0h);
constant half3 hot = half3(1.0h, 0.0h, 0.0h);
[[ stitchable ]] half4 InfaredEffect(float2 position, half4 color) {
    if (color.a > 0) {
        half3 grayValues = half3(0.2125h, 0.7154h, 0.0721h);
        half luma = dot(color.rgb, grayValues);

        half3 newColor;
        if (luma < 0.5) {
            newColor = mix(cold, medium, luma*2);
        } else {
            newColor = mix(medium, hot, (luma-0.5)*2);
        }
        return half4(newColor, 1);
    } else {
        return color;
    }
}

