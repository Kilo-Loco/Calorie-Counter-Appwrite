//
//  LinearGradient+Extensions.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/18/24.
//

import SwiftUI

extension LinearGradient {
    static let calorieCounter: LinearGradient = .init(
        colors: [Color.yellow, Color.orange],
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )
}
