//
//  SmoothStepFunctionExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/26.
//

import SwiftUI

struct SmoothStepFunctionExample: View {
    @State private var startBendingPosition: Float = 0.1
    @State private var lineWidth: Float = 0.05
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle().frame(width: .infinity, height: 300)
                .visualEffect { [startBendingPosition, lineWidth]
                    content,
                        proxy in
                    content
                        .colorEffect(
                            ShaderLibrary
                                .smoothStepFunction(
                                    .float2(proxy.size),
                                    .float(startBendingPosition),
                                    .float(lineWidth)
                                )
                        )
                }.padding()
            Text("Start Bending Position:")
            Slider(value: $startBendingPosition, in: 0 ... 0.45)
            Text("Line Width:")
            Slider(value: $lineWidth, in: 0 ... 1)
        }
    }
}

#Preview {
    SmoothStepFunctionExample()
}
