//
//  InspirationalShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/08.
//

import SwiftUI

struct InspirationalShaderExample: View {
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
                                .InspirationalShader(
                                    .float2(proxy.size),
                                    .float(date.timeIntervalSinceNow)
                                )
                        )
                }
        }
    }
}

#Preview {
    InspirationalShaderExample()
}
