//
//  GlowingRingsExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/08.
//

import SwiftUI

struct GlowingRingsExample: View {
    let date = Date()
    var body: some View {
        TimelineView(.animation) { _ in
            Color.black.ignoresSafeArea()
                .visualEffect {
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary
                                .GlowingRings(
                                    .float2(proxy.size),
                                    .float(date.timeIntervalSinceNow)
                                )
                        )
                }
        }
    }
}

#Preview {
    GlowingRingsExample()
}
