//
//  StripeColorsShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

#include <metal_stdlib>
using namespace metal;



[[ stitchable ]] half4 StripeColorsShader(float2 position, half4 color, float width) {
    half4 red = half4(1, 0, 0, 1);
    half4 green = half4(0, 1, 0, 1);
    half4 blue = half4(0, 0, 1, 1);
    half4 black = half4(0, 0, 0, 1);

    int index = int(fmod(position.x, 3*width)/width);
    half4 result;
    if (index == 0) {
        result = red;
    } else if (index == 1) {
        result = green;
    } else if (index == 2) {
        result = blue;
    } else {
        result = black;
    }
    return mix(color, result, half4(0.5));
}

[[ stitchable ]] half4 StripeColorsFillShader(float2 position, float width) {
    half4 red = half4(1, 0, 0, 1);
    half4 green = half4(0, 1, 0, 1);
    half4 blue = half4(0, 0, 1, 1);
    half4 black = half4(0, 0, 0, 1);

    int index = int(fmod(position.x, 3*width)/width);
    half4 result;
    if (index == 0) {
        result = red;
    } else if (index == 1) {
        result = green;
    } else if (index == 2) {
        result = blue;
    } else {
        result = black;
    }
    return result;
}
