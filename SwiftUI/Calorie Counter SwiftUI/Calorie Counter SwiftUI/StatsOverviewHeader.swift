//
//  StatsOverviewHeader.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/15/24.
//

import SwiftUI

struct StatsOverviewHeader: View {
    let currentValue: CGFloat
    let maxValue: CGFloat
    
    var progress: CGFloat {
        currentValue / maxValue
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            LinearGradient.calorieCounter
                .edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 30) {
                ProgressStatView(title: "EATEN", value: 320, fontSize: 24)
                
                ZStack {
                    ProgressRing(progress: progress)
                        .frame(width: 150)
                    ProgressStatView(
                        title: "CAL LEFT",
                        value: 2105,
                        fontSize: 36
                    )
                }
                
                ProgressStatView(title: "BURNED", value: 124, fontSize: 24)
            }
            .foregroundColor(.white)
            .padding(.vertical, 30)
        }
        
    }
}

#Preview {
    StatsOverviewHeader(currentValue: 150, maxValue: 200)
}
