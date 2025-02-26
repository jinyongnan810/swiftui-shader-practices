//
//  OpacityZeroCircleExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/25.
//

import SwiftUI

struct OpacityZeroCircleExample: View {
    @State private var touchPosition: CGPoint = .zero
    var body: some View {
        TreeView()
            .colorEffect(ShaderLibrary.opacityZeroCircle(
                .float2(touchPosition)
            ))
            .gesture(DragGesture().onChanged { value in
                touchPosition = value.location
            })
            .ignoresSafeArea()
    }
}

#Preview {
    OpacityZeroCircleExample()
}
