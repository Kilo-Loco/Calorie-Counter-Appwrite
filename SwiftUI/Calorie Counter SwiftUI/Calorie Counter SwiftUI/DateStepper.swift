//
//  DateStepper.swift
//  Calorie Counter SwiftUI
//
//  Created by Kilo Loco on 2/18/24.
//

import SwiftUI

struct DateStepper: View {
    
    let date: Binding<Date>
    
    /// Returns "Yesterday", "Today", "Tomorrow", or "MMM dd, yyyy"
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .none
        f.doesRelativeDateFormatting = true
        return f
    }()
    
    var body: some View {
        HStack {
            Button("", systemImage: "chevron.left") {
                decrementDate()
            }
            .frame(minWidth: 44, minHeight: 44, alignment: .leading)
            .foregroundColor(.accentColor)
            
            Spacer()
            
            Text(date.wrappedValue, formatter: formatter)
            
            Spacer()
            
            Button("", systemImage: "chevron.right") {
                incrementDate()
            }
            .frame(minWidth: 44, minHeight: 44,  alignment: .trailing)
            .foregroundColor(.accentColor)
        }
    }
    
    func incrementDate() {
        date.wrappedValue = Calendar.current.date(
            byAdding: .day,
            value: 1,
            to: date.wrappedValue
        )!
    }
    
    func decrementDate() {
        date.wrappedValue = Calendar.current.date(
            byAdding: .day,
            value: -1,
            to: date.wrappedValue
        )!
    }
}

#Preview {
    DateStepper(date: .constant(.now))
}
