//
//  AnimatingCenterExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/24.
//

import SwiftUI

struct AnimatingCenterExample: View {
    @State private var minRadius: CGFloat = 30
    @State private var maxRadius: CGFloat = 100
    @State private var startDate: Date = .init()
    var body: some View {
        TimelineView(.animation) { _ in
            Color.white.ignoresSafeArea()
                .visualEffect { [minRadius, maxRadius, startDate]
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.centerEffect(
                                .float2(proxy.size),
                                .float(startDate.timeIntervalSinceNow),
                                .float(minRadius),
                                .float(maxRadius)
                            )
                        )
                }
        }
    }
}

#Preview {
    AnimatingCenterExample()
}
