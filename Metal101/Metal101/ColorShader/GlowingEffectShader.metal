//
//  GlowingEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

#include <metal_stdlib>
using namespace metal;


[[ stitchable ]] half4 GlowingEffect(float2 position, half4 color, float2 size, float glowIntensity) {
    float2 uv = position / size;
    uv -= 0.5;
    uv.x *= size.x/size.y;
    float threashold = 0.2;
    float lengthOfUV = length(uv);
//    float stepResult = smoothstep(0, threashold, lengthOfUV);
    float stepResult = step(threashold, lengthOfUV);

//    if (lengthOfUV < threashold) {
//        return half4(uv.x, uv.y, color.b, 1);
//    } else {
//        return half4(half3(0.0), 1);
//    }
//    half3 resultColor = mix(half3(uv.x, uv.y, color.b), half3(0.0), stepResult);
    half3 resultColor = mix(half3(1.0), half3(0.0), stepResult);

    float glow = 0.01 / (lengthOfUV - threashold);
    glow = clamp(glow, 0.0, 1.0);
    resultColor += glow * glowIntensity;

    return half4(resultColor, 1.0);
}
