//
//  VoronoiShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/08.
//
// from https://www.shadertoy.com/view/mtyGWy
import SwiftUI

struct AmazingShaderExample: View {
    let date = Date()
    var body: some View {
        TimelineView(.animation) { _ in
            LinearGradient(
                colors: [.blue, .purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            .visualEffect {
                content,
                    proxy in
                content
                    .colorEffect(
                        ShaderLibrary
                            .AmazingShader(
                                .float2(proxy.size),
                                .float(date.timeIntervalSinceNow)
                            )
                    )
            }
        }
    }
}

#Preview {
    AmazingShaderExample()
}
