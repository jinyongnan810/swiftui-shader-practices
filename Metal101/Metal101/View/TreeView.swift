//
//  TreeView.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/24.
//

import SwiftUI

struct TreeView: View {
    var fit: Bool
    init(fit: Bool = false) {
        self.fit = fit
    }

    var tree: some View {
        Image("tree")
            .resizable()
    }

    var body: some View {
        if fit {
            tree.scaledToFit()
        } else {
            tree.scaledToFill()
        }
    }
}

#Preview {
    TreeView()
}
