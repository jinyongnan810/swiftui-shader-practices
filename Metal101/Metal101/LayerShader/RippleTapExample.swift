//
//  RippleTapExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/15.
//

import SwiftUI

struct RippleTapExample: View {
    @State var counter: Int = 0
    @State var origin: CGPoint = .init(x: 0.5, y: 0.5)
    var body: some View {
        TreeView(fit: true)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .onPressingChanged { point in
                if let point {
                    origin = point
                    counter += 1
                }
            }
            .modifier(RippleEffect(at: origin, trigger: counter))
    }
}

#Preview {
    RippleTapExample()
}
