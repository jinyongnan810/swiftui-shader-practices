//
//  GrainyEffectExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

import SwiftUI

struct GrainyEffectExample: View {
    let colors: [Color] = [.red, .green, .blue]
    var body: some View {
        GrainyView {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        colors: colors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 300)
        }
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text("Sci-Fi")
                    .font(.largeTitle)
                Text("Movies And TV Shows")
            }
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
        }
        .padding()
    }
}

struct GrainyView<Content: View>: View {
    let startDate = Date()
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        TimelineView(.animation) { _ in
            content
                .visualEffect {
                    content,
                        proxy in
                    content.colorEffect(
                        ShaderLibrary.GrainyEffect(
                            .float2(proxy.size),
                            .float(
                                startDate.timeIntervalSinceNow
                            )
                        )
                    )
                }
        }
    }
}

#Preview {
    GrainyEffectExample()
}
