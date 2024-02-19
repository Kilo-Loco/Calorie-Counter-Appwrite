//
//  ProgressStatView.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/15/24.
//

import SwiftUI

struct ProgressStatView: View {
    let title: String
    let value: Int
    let fontSize: CGFloat
    
    var body: some View {
        VStack {
            Text(String(value))
                .font(
                    .system(
                        size: fontSize,
                        weight: .bold,
                        design: .serif
                    )
                )
            Text(title)
                .font(.caption)
        }
        
    }
}

#Preview {
    ProgressStatView(title: "BURNED", value: 320, fontSize: 36)
}
