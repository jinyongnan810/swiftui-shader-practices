//
//  StripeColorsShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

import SwiftUI

struct StripeColorsShaderExample: View {
    @State private var stripeWidth: CGFloat = 30

    var shader: Shader {
        ShaderLibrary.StripeColorsShader(.float(stripeWidth))
    }

    var shaderFill: Shader {
        ShaderLibrary.StripeColorsFillShader(.float(stripeWidth))
    }

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .foregroundStyle(shaderFill)
                .padding()
            Text("Hello, World!")
                .padding()
                .border(shaderFill, width: 5)
            Text("Hello, World!")
                .padding()
                .foregroundStyle(.white)
                .background(shaderFill)
            TreeView(fit: true)
                .colorEffect(shader)
            VStack {
                Text("Stripe width: \(stripeWidth.formatted())")
                Slider(value: $stripeWidth, in: 20 ... 200, step: 1)
            }
        }.padding()
    }
}

#Preview {
    StripeColorsShaderExample()
}
