//
//  SmoothStepFunctionShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

#include <metal_stdlib>
using namespace metal;

float plot(float2 uv, float y, float width) {
    float delta = width/2;
//    return smoothstep(y-delta, y, uv.y) - smoothstep(y, y+delta, uv.y);
//    return smoothstep(y-delta, y, uv.y);
    return step(y-delta, uv.y) - step(y+delta, uv.y);
}

[[ stitchable ]] half4 smoothStepFunction(float2 position, half4 color, float2 size, float startBendingPosition, float lineWidth) {
    float2 uv = position / size;
    half4 blue = half4(0,0,1,1);
    half4 green = half4(0,1,0,1);
    half4 graphColor = mix(blue, green, uv.x);
    half4 bgColor = half4(0.3,0.3,0.3,1);

   // float y = smoothstep(startBendingPosition, 1-startBendingPosition, uv.x);
    float y = 0.5 + 0.5 * sin(uv.x * M_PI_H * 2);

    float percent = plot(uv, 1-y, lineWidth);


    half4 result = mix(bgColor, graphColor, percent);
    return result;
}
