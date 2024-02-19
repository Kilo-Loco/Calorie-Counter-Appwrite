//
//  DashboardView.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/15/24.
//

import SwiftUI

struct DashboardView: View {
    
    @State var isExpanded: Bool = false
    
    @State var listOption: ListOption = .available
    
    @State var date: Date = .now
    
    @State var availableFoods: [Food] = {
        var foods: [Food] = []
        
        for i in  0..<20 {
            foods.append(Food(id: String(i), name: "Chicken", calorieCount: 320 + i))
        }
        return foods
    }()
    @State var foodHistory: [Food] = {
        var foods: [Food] = []
        
        for i in  0..<2 {
            foods.append(Food(id: String(i), name: "Burger", calorieCount: 560 + i))
        }
        return foods
    }()
    
    let maxCalories: CGFloat = 2405
    var consumedCalories: CGFloat {
        CGFloat(foodHistory.reduce(0, { $0 + $1.calorieCount }))
    }
    
    var body: some View {
        ScrollView {
            StatsOverviewHeader(currentValue: consumedCalories, maxValue: maxCalories)
                .frame(height: 250)
            
            DateStepper(date: $date)
                .padding(.horizontal)
            
            Picker("", selection: $listOption) {
                Text("Available")
                    .tag(ListOption.available)
                
                Text("History")
                    .tag(ListOption.history)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            switch listOption {
            case .available:
                LazyVStack(content: {
                    ForEach(availableFoods) { food in
                        FoodRow(
                            food: food,
                            config: .addItem({ self.foodHistory.append($0) })
                        )
                    }
                })
                .padding(.horizontal)
            case .history:
                LazyVStack(content: {
                    ForEach(foodHistory) { food in
                        FoodRow(
                            food: food,
                            config: .removeItem({ print($0.id) })
                        )
                    }
                })
                .padding(.horizontal)
            }
        }
        .background(Color(uiColor: .secondarySystemBackground))
        .edgesIgnoringSafeArea(.top)
    }
}

extension DashboardView {
    enum ListOption: Int {
        case available, history
    }
}

#Preview {
    DashboardView()
}
