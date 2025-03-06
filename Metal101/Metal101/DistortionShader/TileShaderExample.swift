//
//  TileShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/06.
//

import SwiftUI

struct TileShaderExample: View {
    @State private var columns = 2.0
    @State private var rows = 3.0
    var body: some View {
        VStack {
            TreeView(fit: true)
                .visualEffect { [columns, rows]
                    content,
                        proxy in
                    content
                        .distortionEffect(ShaderLibrary.TileEffect(
                            .float2(proxy.size),
                            .float2(columns, rows)
                        ), maxSampleOffset: .zero)
                }.padding()
            VStack {
                Text("Columns: \(columns.formatted())")
                Slider(value: $columns, in: 1 ... 10, step: 1)
            }
            VStack {
                Text("Rows: \(rows.formatted())")
                Slider(value: $rows, in: 1 ... 10, step: 1)
            }
        }.padding()
    }
}

#Preview {
    TileShaderExample()
}
