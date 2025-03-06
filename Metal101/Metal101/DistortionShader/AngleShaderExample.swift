//
//  AngleShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

import SwiftUI

struct AngleShaderExample: View {
    @State private var angleInRadians = Double.pi / 4
    @State private var force = 100.0
    var angleInDegrees: Double { angleInRadians * 180 / Double.pi }
    var body: some View {
        VStack {
            TreeView(fit: true)
                .visualEffect { [angleInRadians, force]
                    content,
                        proxy in
                    content
                        .distortionEffect(ShaderLibrary.AngleEffect(
                            .float2(proxy.size),
                            .float(angleInRadians),
                            .float(force)
                        ), maxSampleOffset: .zero)
                }.padding()
            VStack {
                Slider(value: $force, in: -300 ... 300)
                Text("Force: \(force.formatted())")
                Slider(value: $angleInRadians, in: 0 ... 2 * Double.pi)
                Text("Angle(degrees): \(angleInDegrees.formatted())")
                Image(systemName: "arrowshape.right")
                    .imageScale(.large)
                    .rotationEffect(.degrees(angleInDegrees))
                    .padding()
            }
        }.padding()
    }
}

#Preview {
    AngleShaderExample()
}
