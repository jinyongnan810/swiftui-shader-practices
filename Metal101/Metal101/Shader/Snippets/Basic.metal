//
//  Basic.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

// Color Effect: https://developer.apple.com/documentation/swiftui/view/coloreffect(_:isenabled:)
// [[ stitchable ]] half4 name(float2 position, half4 color, args...)
[[ stitchable ]] half4 name1(float2 position, half4 color) {
    half4 result = color.a == 0 ? half4(1, 0.3, 1, 1) : color;
    return result;
}

// Distortion Effect: https://developer.apple.com/documentation/swiftui/view/distortioneffect(_:maxsampleoffset:isenabled:)
// [[ stitchable ]] float2 name(float2 position, args...)
[[ stitchable ]] float2 SineShader(float2 position, float amplitude) {
    float2 result = float2(position.x, position.y + amplitude * sin(position.x));
    return result;
}

// layerEffect: https://developer.apple.com/documentation/swiftui/view/layereffect(_:maxsampleoffset:isenabled:)
// [[ stitchable ]] half4 name(float2 position, SwiftUI::Layer layer, args...)
[[ stitchable ]] half4 name3(float2 position, SwiftUI::Layer layer) {
    return half4(0, 0, 1, 1);
}
