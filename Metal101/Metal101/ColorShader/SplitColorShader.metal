//
//  SplitColorShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 SplitColor(float2 position, half4 color, float2 size, float percent) {
    float2 uv = position / size;
//    if(uv.x >= percent) {
//        return half4(color.r * 0.7, color.g * 0.7, 1, 1);
//    }
//    return half4(1, color.g * 0.7, color.b * 0.7, 1);

    // without if statement
    half4 blueishColor = half4(color.r * 0.7, color.g * 0.7, 1, 1);
    half4 redishColor = half4(1, color.g * 0.7, color.b * 0.7, 1);
    half mask = smoothstep(percent - 0.03, percent + 0.03, uv.x);
//    half mask = step(percent, uv.x);

    return mix(blueishColor, redishColor, mask);


}
