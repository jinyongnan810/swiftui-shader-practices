//
//  SwizzleExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/25.
//

import SwiftUI

struct SwizzleType: Identifiable {
    let id = UUID()
    let shader: Shader
    let name: String
}

let swizzleTypes: [SwizzleType] = [
    .init(shader: ShaderLibrary.Swizzle1(), name: "Original"),
    .init(shader: ShaderLibrary.Swizzle2(), name: "grba"),
    .init(shader: ShaderLibrary.Swizzle3(), name: "rrra"),
    .init(shader: ShaderLibrary.Swizzle4(), name: "ggra"),
    .init(shader: ShaderLibrary.Swizzle5(), name: "yyzw"),
    .init(shader: ShaderLibrary.Swizzle6(), name: "No blue"),
    .init(shader: ShaderLibrary.Swizzle7(), name: "RG set to 1"),
]

struct SwizzleExample: View {
    var body: some View {
        List {
            ForEach(swizzleTypes) { swizzleType in
                Section(swizzleType.name) {
                    HStack {
                        ColorBoxView()
                        Spacer()
                        Text(swizzleType.name)
                        Spacer()
                        ColorBoxView()
                            .colorEffect(swizzleType.shader)
                    }
                }
            }
        }
    }
}

struct ColorBoxView: View {
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
    var body: some View {
        VStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                Rectangle()
                    .fill(color)
                    .frame(width: 100, height: 20)
            }
        }
    }
}

#Preview {
    SwizzleExample()
}
