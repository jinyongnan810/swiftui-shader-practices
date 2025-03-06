//
//  GlowingEffectExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

import SwiftUI

struct GlowingEffectExample: View {
    @State private var glowIntensity: Float = 1
    var body: some View {
        VStack {
            Color.blue.ignoresSafeArea()
                .visualEffect { [glowIntensity]
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary
                                .GlowingEffect(
                                    .float2(proxy.size),
                                    .float(glowIntensity)
                                )
                        )
                }

            VStack {
                Text("Glow Intensity: \(glowIntensity.formatted())")
                Slider(value: $glowIntensity, in: 0 ... 20)
            }.padding()
        }
    }
}

#Preview {
    GlowingEffectExample()
}
