//
//  ContentView.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

import SwiftUI

struct ContentView: View {
    @State private var amplitude: Float = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Color Effect!")
                .font(.largeTitle)
                .colorEffect(ShaderLibrary.name1())
            Text("Distortion Effect!")
                .font(.largeTitle)
                .distortionEffect(
                    ShaderLibrary.SineShader(.float(amplitude)),
                    maxSampleOffset: .zero
                )
            Text("Layer Effect!")
                .font(.largeTitle)
                .layerEffect(ShaderLibrary.name3(), maxSampleOffset: .zero)
            Spacer()
            Slider(value: $amplitude, in: -5...5) {
                Text("Amplitude: \(amplitude, specifier: "%.1f")")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
