//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

float oscillation1(float x, float speed, float offset) {
    return pow(sin(x * speed + offset), 2);
}

constant float2 points[30] = {
    float2(0.5, 0.6),
    float2(0.7, 0.8),
    float2(0.2, 0.3),
    float2(0.9, 0.1),
    float2(0.4, 0.5),
    float2(0.1, 0.9),
    float2(0.8, 0.2),
    float2(0.3, 0.7),
    float2(0.6, 0.4),
    float2(0.0, 0.0),
    float2(0.9, 0.9),
    float2(0.2, 0.8),
    float2(0.7, 0.3),
    float2(0.4, 0.1),
    float2(0.1, 0.6),
    float2(0.8, 0.5),
    float2(0.3, 0.2),
    float2(0.6, 0.9),
    float2(0.0, 0.4),
    float2(0.9, 0.6),
    float2(0.2, 0.5),
    float2(0.7, 0.0),
    float2(0.4, 0.8),
    float2(0.1, 0.3),
    float2(0.8, 0.9),
    float2(0.3, 0.6),
    float2(0.6, 0.1),
    float2(0.0, 0.8),
    float2(0.9, 0.3),
    float2(0.2, 0.0)
};

constant half3 colors[30] = {
    half3(0.5, 0.3, 0.8),
    half3(0.1, 0.9, 0.4),
    half3(0.7, 0.2, 0.6),
    half3(0.3, 0.8, 0.1),
    half3(0.9, 0.5, 0.2),
    half3(0.4, 0.7, 0.3),
    half3(0.2, 0.6, 0.9),
    half3(0.8, 0.1, 0.5),
    half3(0.6, 0.4, 0.7),
    half3(0.5, 0.2, 0.3),
    half3(0.3, 0.9, 0.8),
    half3(0.7, 0.1, 0.4),
    half3(0.1, 0.5, 0.6),
    half3(0.9, 0.3, 0.7),
    half3(0.4, 0.8, 0.2),
    half3(0.2, 0.7, 0.5),
    half3(0.8, 0.6, 0.1),
    half3(0.6, 0.9, 0.4),
    half3(0.5, 0.1, 0.7),
    half3(0.3, 0.4, 0.9),
    half3(0.7, 0.5, 0.2),
    half3(0.1, 0.8, 0.6),
    half3(0.9, 0.2, 0.3),
    half3(0.4, 0.6, 0.8),
    half3(0.2, 0.9, 0.5),
    half3(0.8, 0.3, 0.7),
    half3(0.6, 0.1, 0.4),
    half3(0.5, 0.7, 0.9),
    half3(0.3, 0.2, 0.6),
    half3(0.7, 0.4, 0.1)
};

[[ stitchable ]] half4 VoronoiShader(float2 position, half4 color, float2 size, float time) {
    half3 result = half3(0);
    float2 uv = position / size;
    uv.x *= size.x / size.y;
    float minDist = 1;
    float dotRadius = 0.005;
    for(int i=0;i<30;i++){
        float2 animatedPoint = points[i];
        float2 oscillation = float2(sin(time+i), cos(time+i)) * 0.05;
        animatedPoint += oscillation;
        float dist = length(uv - animatedPoint);
        if(dist < minDist) {
            minDist = dist;
            result = colors[i];
//            break;
        }
        if(dist < dotRadius) {
            result = half3(0);
        }
    }

    return half4(result, 1);
}
