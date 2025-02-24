//
//  UVShaderExample.swift
//  Metal101
//
//  Created by Yuunan kin on 2025/02/24.
//

import SwiftUI

struct UVShaderExample: View {
    var body: some View {
        List {
            DisclosureGroup("UV Shader Example 1") {
                TreeView(fit: true)
                    .visualEffect { content, proxy in
                        content
                            .colorEffect(ShaderLibrary.colorShaderWithPosition1(.float2(proxy.size)))
                    }
            }

            DisclosureGroup("UV Shader Example 2") {
                TreeView(fit: true)
                    .visualEffect { content, proxy in
                        content
                            .colorEffect(ShaderLibrary.colorShaderWithPosition2(.float2(proxy.size)))
                    }
            }

            DisclosureGroup("UV Shader Example 3") {
                TreeView(fit: true)
                    .visualEffect { content, proxy in
                        content
                            .colorEffect(ShaderLibrary.colorShaderWithPosition3(.float2(proxy.size)))
                    }
            }
            DisclosureGroup("UV Shader Example 4") {
                TreeView(fit: true)
                    .visualEffect { content, proxy in
                        content
                            .colorEffect(ShaderLibrary.colorShaderWithPosition4(.float2(proxy.size)))
                    }
            }
            DisclosureGroup("UV Shader Example 5") {
                TreeView(fit: true)
                    .visualEffect { content, proxy in
                        content
                            .colorEffect(ShaderLibrary.colorShaderWithPosition5(.float2(proxy.size)))
                    }
            }
        }
    }
}

#Preview {
    UVShaderExample()
}
