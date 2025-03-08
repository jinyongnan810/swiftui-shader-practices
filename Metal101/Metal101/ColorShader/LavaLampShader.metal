//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

float oscillation(float x, float speed, float offset) {
    return pow(sin(x * speed + offset), 2);
}

[[ stitchable ]] half4 LavaLampShader(float2 position, half4 color, float2 size, float time) {
    half4 result = half4(0);
    float2 uv = position / size;

    float threshhold = 0.3;
    float distanceFactor = 10;

    // x, y, strength
    float3 blobCenters[6];
    blobCenters[0] = float3(0.6,oscillation(time, 0.5, 0.4),0.5);
    blobCenters[1] = float3(0.5,oscillation(time, 0.2, 0.5),1);
    blobCenters[2] = float3(0.2,oscillation(time, 0.2, 0.1),0.5);
    blobCenters[3] = float3(0.4,oscillation(time, 0.1, 0.2),0.8);
    blobCenters[4] = float3(0.3,oscillation(time, 0.1, 0),0.8);
    blobCenters[5] = float3(0.8,oscillation(time, 0.2, 1),0.6);


    int numberOfBlobs = sizeof(blobCenters) / sizeof(blobCenters[0]);

    float influence = 0.0;
    for(int i=0;i<numberOfBlobs;i++) {
        float distanceToBlobCenter = distance(size*blobCenters[i].xy, position) / distanceFactor;
        influence += blobCenters[i].z / distanceToBlobCenter;
    }
    if(influence > threshhold) {
//        result = mix(half4(0,0,uv.y,1), half4(0,uv.y,0,1),0.1);
        result = half4(1 - uv.y + 0.3, uv.x, uv.x * uv.y, 1);
    }

    return result;
}
