//
//  VoronoiShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/08.
//
import SwiftUI

struct FractalBrownianMotionShaderExample: View {
    @State var date = Date()
    var body: some View {
        VStack {
            ZStack {
                TimelineView(.animation) { _ in
                    Color.black
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .colorEffect(
                            ShaderLibrary
                                .FBMShader(
                                    .boundingRect,
                                    .float(
                                        date.timeIntervalSinceNow
                                    )
                                )
                        )
                }
                Text("Fractal Brownian Motion")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .clipShape(Capsule())
            .padding()
            TimelineView(.animation) { _ in
                Color.black
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .colorEffect(
                        ShaderLibrary
                            .FBMShader(
                                .boundingRect,
                                .float(
                                    date.timeIntervalSinceNow
                                )
                            )
                    ).mask {
                        Text("Fractal Brownian Motion")
                            .font(.title)
                            .fontWeight(.bold)
                            .overlay {}
                    }
            }
        }
    }
}

#Preview {
    FractalBrownianMotionShaderExample()
}
