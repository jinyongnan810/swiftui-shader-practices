//
//  LavaLampShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/08.
//

import SwiftUI

struct LavaLampShaderExample: View {
    let date = Date()
    var body: some View {
        TimelineView(.animation) { _ in
//            TreeView().ignoresSafeArea()
            Color.black.ignoresSafeArea()
                .visualEffect {
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary
                                .LavaLampShader(
                                    .float2(proxy.size),
                                    .float(date.timeIntervalSinceNow)
                                )
                        )
                }
        }
    }
}

#Preview {
    LavaLampShaderExample()
}
