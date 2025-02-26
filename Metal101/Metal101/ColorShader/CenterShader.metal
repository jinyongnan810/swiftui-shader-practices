//
//  CenterShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/24.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] half4 centerEffect(float2 position, half4 color, float2 size, float time, float minRadius, float maxRadius) {
    float2 center = size / 2;
    float maxDistance = metal::distance(center, float2(0, 0));
    float distance = metal::distance(center, position);
    float maxRadiusWithTime = maxRadius + sin(time)*30;
    float minRadiusWithTime = minRadius + cos(time)*10;

    if(distance >= minRadiusWithTime && distance <= maxRadiusWithTime) {
        float rate = distance / maxRadiusWithTime;
        return half4(1-rate, rate, 1, 1);
    }
    if(distance < minRadiusWithTime) {
        float rate = distance / minRadiusWithTime;
        return half4(rate, 1-rate, 1, 1);
    }
    float rate = distance / maxDistance;
    return half4(rate, rate, 1 - rate, 0.5 + sin(time)*0.5);
}
