//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 InspirationalShader(float2 position, half4 color, float2 size, float time) {
    float2 speed = float2(2, 9);
    float complexity = 1.0;
    half3 colorResult = half3(1);

    float adjustedTime = 0.5 * abs(time);

    float2 uv = position / size;
    float2 tempUV = uv;
    tempUV -= 0.5;
    tempUV.x *= size.x / size.y;

    float len = length(tempUV);


    for(int i = 0; i < 3; i++) {
        float2 adjustedUV = uv;

        adjustedTime += 0.7;

        float2 term1 = tempUV / len;
        float2 term2 = sin(adjustedTime) + 3;
        float2 term3 = abs(sin(speed.y * len - speed.x * adjustedTime));

        adjustedUV += term1 * term2 * term3;

        colorResult[i] = 0.01 / length(fmod(adjustedUV, complexity));
    }


    half4 result = half4(colorResult / len, 1);
    result = mix(result, color, 0.5);

    return result;
}
