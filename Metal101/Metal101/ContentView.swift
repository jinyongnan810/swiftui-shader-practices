//
//  ContentView.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Color Shader") {
                    NavigationLink("Gray Scale") {
                        GrayScaleExample()
                    }
                    NavigationLink("UV Pixel Coordinate") {
                        UVShaderExample()
                    }
                    NavigationLink("Animation with Timeline") {
                        AnimatingCenterExample()
                    }
                    NavigationLink("Draggable Circle") {
                        OpacityZeroCircleExample()
                    }
                    NavigationLink("Swizzle") {
                        SwizzleExample()
                    }
                    NavigationLink("Smooth Line Plot") {
                        SmoothStepFunctionExample()
                    }
                }

            }.navigationTitle("Metal 101")
        }
    }
}

#Preview {
    ContentView()
}
