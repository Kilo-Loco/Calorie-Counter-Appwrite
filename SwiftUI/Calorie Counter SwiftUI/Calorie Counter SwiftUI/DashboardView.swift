//
//  DashboardView.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/15/24.
//

import SwiftUI

struct DashboardView: View {
    
    @State var isExpanded: Bool = false
    
    @State var listOption: ListOption = .food
    
    @State var date: Date = .now
    
    @State var availableFoods: [Food] = {
        var foods: [Food] = []
        
        for i in  0..<20 {
            foods.append(Food(id: "chicken" + String(i), name: "Chicken", calorieCount: 320 + i))
        }
        return foods
    }()
    @State var foodHistory: [Food] = {
        var foods: [Food] = []
        
        for i in  0..<2 {
            foods.append(Food(id: "burger" + String(i), name: "Burger", calorieCount: 560 + i))
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
                Text("Food")
                    .tag(ListOption.food)
                
                Text("Exercise")
                    .tag(ListOption.exercise)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            switch listOption {
            case .food:
                LazyVStack(content: {
                    Section(isExpanded: $isExpanded) {
                        ForEach(foodHistory) { food in
                            FoodRow(
                                food: food,
                                config: .removeItem { item in self.foodHistory.removeAll(where: { $0.id == item.id }) }
                            )
                        }
                    } header: {
                        HStack {
                            Text("History")
                                .font(.headline)
                            Spacer()
                            Button(
                                "",
                                systemImage: isExpanded ? "chevron.down" : "chevron.right",
                                action: { isExpanded.toggle() }
                            )
                        }
                    }


                    
                    Section {
                        ForEach(availableFoods) { food in
                            FoodRow(
                                food: food,
                                config: .addItem({ self.foodHistory.append($0) })
                            )
                        }
                    } header: {
                        HStack {
                            Text("Available")
                                .font(.headline)
                            Spacer()
                        }
                    }
                })
                .padding(.horizontal)
            case .exercise:
                LazyVStack(content: {
                    
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
        case food, exercise
    }
}

#Preview {
    DashboardView()
}
