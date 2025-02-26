//
//  GrayScaleExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/09.
//

import simd
import SwiftData
import SwiftUI

@Model
class WeightsModel {
    var name: String
    var redWeight: Float
    var greenWeight: Float
    var blueWeight: Float
    init(
        name: String,
        redWeight: Float,
        greenWeight: Float,
        blueWeight: Float
    ) {
        self.name = name
        self.redWeight = redWeight
        self.greenWeight = greenWeight
        self.blueWeight = blueWeight
    }
}

struct GrayScaleExample: View {
    @State private var redWeight: Float = 0.33
    @State private var greenWeight: Float = 0.33
    @Environment(\.modelContext) var modelContext

    @Query private var savedWeights: [WeightsModel]

    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    TreeView()
                        .colorEffect(
                            ShaderLibrary
                                .grayScale(
                                    .float4(redWeight, greenWeight, 1 - redWeight - greenWeight, 0)
                                )
                        )
                        .ignoresSafeArea()
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height
                        )
                    VStack {
                        Spacer()
                        GrayScaleControls(redWeight: $redWeight, greenWeight: $greenWeight)
                            .padding()
                    }
                }
            }.toolbar {
                Button("Add", systemImage: "plus.circle") {
                    let item = WeightsModel(
                        name: "Weights \(savedWeights.count + 1)",
                        redWeight: redWeight,
                        greenWeight: greenWeight,
                        blueWeight: 1 - redWeight - greenWeight
                    )
                    modelContext.insert(item)
                    try? modelContext.save()
                }
            }
        }
    }
}

struct GrayScaleControls: View {
    @Binding var redWeight: Float
    @Binding var greenWeight: Float
    @Query private var savedWeights: [WeightsModel]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Red Weight: \(redWeight.formatted())")
            Slider(value: $redWeight, in: 0 ... 1 - greenWeight)
            Text("Green Weight: \(greenWeight.formatted())")
            Slider(value: $greenWeight, in: 0 ... 1 - redWeight)
            Text("Blue Weight: \((1 - redWeight - greenWeight).formatted())")
            HStack {
                // https://en.wikipedia.org/wiki/Luma_(video)
                Button("Equal") {
                    withAnimation {
                        redWeight = 0.33
                        greenWeight = 0.33
                    }
                }.buttonStyle(.borderedProminent)
                Button("601 Luma") {
                    withAnimation {
                        redWeight = 0.299
                        greenWeight = 0.587
                    }
                }.buttonStyle(.borderedProminent)
                Button("709 Rec") {
                    withAnimation {
                        redWeight = 0.2126
                        greenWeight = 0.7152
                    }
                }.buttonStyle(.borderedProminent)
            }
            Text("Saved Weights(\(savedWeights.count)):").padding(.top)
            if savedWeights.count > 0 {
                ForEach(savedWeights) { weight in
                    Text(
                        "red: \(weight.redWeight.formatted()), green: \(weight.greenWeight.formatted()), blue: \(weight.blueWeight.formatted())"
                    ).onTapGesture {
                        withAnimation {
                            redWeight = weight.redWeight
                            greenWeight = weight.greenWeight
                        }
                    }
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    GrayScaleExample()
        .modelContainer(for: WeightsModel.self)
}
