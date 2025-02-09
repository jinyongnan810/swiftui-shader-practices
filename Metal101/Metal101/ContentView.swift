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
                }

            }.navigationTitle("Metal 101")
        }
    }
}

#Preview {
    ContentView()
}
