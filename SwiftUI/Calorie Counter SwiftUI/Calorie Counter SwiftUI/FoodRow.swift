//
//  FoodRow.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/18/24.
//

import SwiftUI

struct FoodRow: View {
    let food: Food
    let config: Configuration
    
    var body: some View {
        ZStack {
            Color(uiColor: .tertiarySystemBackground)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(food.name)
                    Text("\(food.calorieCount) cal")
                        .font(.footnote)
                }
                
                Spacer()
                
                Button(
                    action: {config.action(food) },
                    label: {
                        Image(systemName: config.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 44)
                    }
                )
            }
            .padding()
        }
        .clipShape(.rect(cornerRadius: 8))
    }
}

extension FoodRow {
    struct Configuration {
        let imageName: String
        let action: (Food) -> Void
    }
}

extension FoodRow.Configuration {
    static func addItem(_ action: @escaping (Food) -> Void) -> Self {
        .init(imageName: "plus.circle.fill", action: action)
    }
    
    static func removeItem(_ action: @escaping (Food) -> Void) ->  Self {
        .init(imageName: "minus.circle.fill", action: action)
    }
}

#Preview {
    FoodRow(food: .init(id: "0", name: "chicken", calorieCount: 200), config: .addItem({_ in}))
}
