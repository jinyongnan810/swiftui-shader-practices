//
//  TileShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] float2 TileEffect(float2 position, float2 size, float2 tile) {
    float2 result = fmod(position * tile, size);
    return result;
}

