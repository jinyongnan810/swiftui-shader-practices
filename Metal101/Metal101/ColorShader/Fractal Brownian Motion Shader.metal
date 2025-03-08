//
//  GrainyEffectShader.metal
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//
#include <metal_stdlib>
using namespace metal;

float hash(float n) {
    return fract(sin(n) * 753.5453123);
}

float noise(float2 x) {
    float2 p = floor(x);
    float2 f = fract(x);
    f = f*f*(3-2*f);
    float n = p.x + p.y*157;

    float v1 = mix(hash(n), hash(n+1), f.x);
    float v2 = mix(hash(n+157), hash(n+158), f.x);
    return mix(v1, v2, f.y);
}

float fbm(float2 p, half3 a) {
    half2 uv = half2(p.xy);
    float v = 0;
    float amplitude = 0.5;
    half2 shift = half2(100,100);
    float angle = 0.2;
    half2x2 rotation = half2x2(
                               cos(angle), sin(angle),
                               -sin(angle), cos(angle)
                               );
    for(int i=0;i<3;i++) {
        v += amplitude*noise(float2(uv));
        uv = rotation * uv * 2.0 + shift;
        a *= 0.5;
    }

    return v;
}

half3 drawLines(float2 uv, float time) {
    float tempTime = time;
    tempTime *=0.05;
    half3 color = half3(0);
    half sinOfTime = abs(sin(tempTime));
    half cosOfTime = abs(cos(tempTime));
    half3 colors[4] = {
        half3(0.7*sinOfTime,0.05*cosOfTime,sinOfTime),
        half3(sinOfTime,0.19,0),
        half3(0,cosOfTime,0.3),
        half3(0,0.38,1),
    };

    for(int i=0;i<4;i++) {
        float iInF = float(i);
        float amplitude = 10 + iInF*0.1;
        float period = 2+iInF*2;
        float thickness = mix(0.4, 0.2, noise(uv*2));

        float t = abs(
                      1. / (sin(uv.y
                           +fbm(uv + tempTime*period, half3(1))
                           )*amplitude)
                      *thickness
                    );
        color += t * colors[i];
    }


    return color;
}

[[ stitchable ]] half4 FBMShader(float2 position, half4 color, float4 bounds, float time) {
    float2 uv = (position / bounds.w) - 1;
    uv *= 1.5;
    half3 result = half3(0.0);

    int glowFactor = 1;
    for(int i=0;i<glowFactor;i++) {
        result += drawLines(uv, abs(time));
    }

    return half4(result, 1);
}
