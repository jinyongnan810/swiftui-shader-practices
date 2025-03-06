//
//  TileShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] float2 AngleEffect(float2 position, float2 size, float angle, float force) {
    float x = cos(angle);
    float y = sin(angle);
    float2 displacement = float2(x, y) * force;
    float2 result = position - displacement;
    return result;
}

