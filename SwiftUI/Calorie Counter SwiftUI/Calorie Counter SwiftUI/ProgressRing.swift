//
//  ProgressRing.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/15/24.
//

import SwiftUI

struct ProgressRing: View {
    @Environment(\.colorScheme) var colorScheme
    
    let progress: CGFloat
    let lineWidth: CGFloat
    
    var paddingOffset: CGFloat {
        lineWidth / 2
    }
    
    init(progress: CGFloat, lineWidth: CGFloat = 8) {
        self.progress = progress
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.4), lineWidth: lineWidth)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.white,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
        }
        .padding(paddingOffset)
    }
}

#Preview {
    ProgressRing(progress: 0.87)
}
