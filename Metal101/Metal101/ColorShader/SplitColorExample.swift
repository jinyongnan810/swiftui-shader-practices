//
//  SplitColorExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

import SwiftUI

struct SplitColorExample: View {
    @State private var splitLine: Float = 0.5
    var body: some View {
        VStack {
            TreeView(fit: true)
                .visualEffect {
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.SplitColor(
                                .float2(proxy.size),
                                .float(
                                    splitLine
                                )
                            )
                        )
                }
            Slider(value: $splitLine, in: 0 ... 1)
        }
    }
}

#Preview {
    SplitColorExample()
}
