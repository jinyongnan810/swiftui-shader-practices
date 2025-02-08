//
//  ContentView.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Color Effect!")
                .font(.largeTitle)
                .colorEffect(ShaderLibrary.name1())
            Text("Distortion Effect!")
                .font(.largeTitle)
                .distortionEffect(ShaderLibrary.name2(), maxSampleOffset: .zero)
            Text("Layer Effect!")
                .font(.largeTitle)
                .layerEffect(ShaderLibrary.name3(), maxSampleOffset: .zero)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
