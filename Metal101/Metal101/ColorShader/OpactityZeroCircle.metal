//
//  OpactityZeroCircle.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/25.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] half4 opacityZeroCircle(float2 position, half4 color, float2 touchPosition) {
    float distance = metal::distance(position, touchPosition);
    if(distance > 100) {
        return mix(half4(color.r, color.g, color.b, 0.3), color.brga, 0.4);
    }
    float rate = distance / 100;
    return half4(color.r, color.g, color.b, 1 - rate * rate);
}
