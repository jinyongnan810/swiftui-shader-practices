//
//  DotIndicatorExample.swift
//  Metal101
//
//  Created by Codex on 2025/08/20.
//

import SwiftUI

private struct NotificationDotIndicator: View {
    let size: CGFloat
    let color: Color
    let time: TimeInterval

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: size, height: size)
            .visualEffect { content, proxy in
                content.colorEffect(
                    ShaderLibrary.DotIndicatorShader(
                        .float2(proxy.size),
                        .float(time)
                    )
                )
            }
            .shadow(color: color.opacity(0.3), radius: size * 0.2)
    }
}

struct DotIndicatorExample: View {
    private let startDate = Date()

    var body: some View {
        TimelineView(.animation) { context in
            let time = startDate.timeIntervalSince(context.date)

            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.94, green: 0.96, blue: 0.99),
                        Color(red: 0.85, green: 0.89, blue: 0.95),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.16, green: 0.19, blue: 0.26),
                                Color(red: 0.09, green: 0.11, blue: 0.17),
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 220, height: 160)
                    .overlay(alignment: .topTrailing) {
                        NotificationDotIndicator(
                            size: 100,
                            color: .white, // Color(red: 1.0, green: 0.26, blue: 0.22),
                            time: time
                        )
                        .offset(x: 30, y: -30)
                    }
                    .overlay(alignment: .bottomLeading) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Inbox")
                                .font(.title2.weight(.semibold))
                                .foregroundStyle(.white)
                            Text("3 unread")
                                .font(.callout)
                                .foregroundStyle(.white.opacity(0.75))
                        }
                        .padding(20)
                    }
                    .shadow(color: .black.opacity(0.2), radius: 24, y: 12)
            }
        }
        .navigationTitle("Dot Indicator")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DotIndicatorExample()
}
