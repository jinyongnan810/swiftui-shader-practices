//
//  ContentView.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

import SwiftUI

// MARK: - Page Enum

/// Defines all available shader demo pages in the app.
enum Page: String, Hashable {
    // Color Shader
    case grayScale = "Gray Scale"
    case infaredEffect = "Infared Effect"
    case uvPixelCoordinate = "UV Pixel Coordinate"
    case animationWithTimeline = "Animation with Timeline"
    case draggableCircle = "Draggable Circle"
    case swizzle = "Swizzle"
    case smoothLinePlot = "Smooth Line Plot"
    case glowingRings = "Glowing Rings"
    case grainyEffect = "Grainy Effect"
    case splitColor = "Split Color"
    case glowEffect = "Glow Effect"
    case stripeColors = "Stripe Colors"
    case inspirationShader = "Inspiration Shader"
    case blobAnimationShader = "Blob Animation Shader"
    case voronoiShader = "Voronoi Shader"
    case amazingShader = "Amazing Shader"
    case fractalBrownianMotionShader = "Fractal Brownian Motion Shader"
    // Distortion Shader
    case tileShader = "Tile Shader"
    case angleShader = "Angle Shader"
    // Layer Shader
    case rippleTap = "Ripple Tap"
}

// MARK: - Page Collections

/// Color shader demos
let colorShaderPages: [Page] = [
    .grayScale,
    .infaredEffect,
    .uvPixelCoordinate,
    .animationWithTimeline,
    .draggableCircle,
    .swizzle,
    .smoothLinePlot,
    .glowingRings,
    .grainyEffect,
    .splitColor,
    .glowEffect,
    .stripeColors,
    .inspirationShader,
    .blobAnimationShader,
    .voronoiShader,
    .amazingShader,
    .fractalBrownianMotionShader,
]

/// Distortion shader demos
let distortionShaderPages: [Page] = [
    .tileShader,
    .angleShader,
]

/// Layer shader demos
let layerShaderPages: [Page] = [
    .rippleTap,
]

// MARK: - ContentView

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Color Shader") {
                    ForEach(colorShaderPages, id: \.self) { page in
                        NavigationLink(page.rawValue, value: page)
                    }
                }
                Section("Distortion Shader") {
                    ForEach(distortionShaderPages, id: \.self) { page in
                        NavigationLink(page.rawValue, value: page)
                    }
                }
                Section("Layer Shader") {
                    ForEach(layerShaderPages, id: \.self) { page in
                        NavigationLink(page.rawValue, value: page)
                    }
                }
            }
            .navigationTitle("Metal 101")
            .navigationDestination(for: Page.self) { page in
                switch page {
                case .grayScale:
                    GrayScaleExample()
                case .infaredEffect:
                    InfaredEffectExample()
                case .uvPixelCoordinate:
                    UVShaderExample()
                case .animationWithTimeline:
                    AnimatingCenterExample()
                case .draggableCircle:
                    OpacityZeroCircleExample()
                case .swizzle:
                    SwizzleExample()
                case .smoothLinePlot:
                    SmoothStepFunctionExample()
                case .glowingRings:
                    GlowingRingsExample()
                case .grainyEffect:
                    GrainyEffectExample()
                case .splitColor:
                    SplitColorExample()
                case .glowEffect:
                    GlowingEffectExample()
                case .stripeColors:
                    StripeColorsShaderExample()
                case .inspirationShader:
                    InspirationalShaderExample()
                case .blobAnimationShader:
                    LavaLampShaderExample()
                case .voronoiShader:
                    VoronoiShaderExample()
                case .amazingShader:
                    AmazingShaderExample()
                case .fractalBrownianMotionShader:
                    FractalBrownianMotionShaderExample()
                case .tileShader:
                    TileShaderExample()
                case .angleShader:
                    AngleShaderExample()
                case .rippleTap:
                    RippleTapExample()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
