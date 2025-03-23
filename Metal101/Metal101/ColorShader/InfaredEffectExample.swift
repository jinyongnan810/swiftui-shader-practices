//
//  InfaredEffectExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/03/23.
//

import SwiftUI

struct InfaredEffectExample: View {
    var body: some View {
        TreeView()
            .ignoresSafeArea()
            .colorEffect(ShaderLibrary.InfaredEffect())
    }
}

#Preview {
    InfaredEffectExample()
}
