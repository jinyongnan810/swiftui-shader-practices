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
                    NavigationLink("Infared Effect") {
                        InfaredEffectExample()
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
                    NavigationLink("Glowing Rings") {
                        GlowingRingsExample()
                    }
                    NavigationLink("Grainy Effect") {
                        GrainyEffectExample()
                    }
                    NavigationLink("Split Color") {
                        SplitColorExample()
                    }
                    NavigationLink("Glow Effect") {
                        GlowingEffectExample()
                    }
                    NavigationLink("Stripe Colors") {
                        StripeColorsShaderExample()
                    }
                    NavigationLink("Inspiration Shader") {
                        InspirationalShaderExample()
                    }
                    NavigationLink("Blob Animation Shader") {
                        LavaLampShaderExample()
                    }
                    NavigationLink("Voronoi Shader") {
                        VoronoiShaderExample()
                    }
                    NavigationLink("Amazing Shader") {
                        AmazingShaderExample()
                    }
                    NavigationLink("Fractal Brownian Motion Shader") {
                        FractalBrownianMotionShaderExample()
                    }
                }
                Section("Distortion Shader") {
                    NavigationLink("Tile Shader") {
                        TileShaderExample()
                    }
                    NavigationLink("Angle Shader") {
                        AngleShaderExample()
                    }
                }

                Section("Layer Shader") {
                    NavigationLink("Ripple Tap") {
                        RippleTapExample()
                    }
                }

            }.navigationTitle("Metal 101")
        }
    }
}

#Preview {
    ContentView()
}
