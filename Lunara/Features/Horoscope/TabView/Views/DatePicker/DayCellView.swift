//
//  DayCellView.swift
//  Lunara
//
//  Created by Alexandra on 3.02.26.
//

import SwiftUI

struct DayCellView: View {
    private static let calendar = Calendar.current
    
    let date: Date
    @Binding var selectedDate: Date
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: backgroundColor)
            
            VStack(spacing: 8) {
                Text("\(DayCellView.calendar.component(.day, from: date))")
                    .font(.chivoHeadingMedium)
                Text(dayOfTheWeekAbbreviation)
                    .font(.chivoButtonXSmall)
            }
            .foregroundStyle(.white)
        }
        .aspectRatio(0.8, contentMode: .fit)
        .roundedRectangleGradientBorder()
    }
    
    private var isSelected: Bool {
        DayCellView.calendar.isDate(selectedDate, inSameDayAs: date)
    }

    private var isToday: Bool {
        DayCellView.calendar.isDateInToday(date)
    }
    
    private var dayOfTheWeekAbbreviation: String { date.formatted(Date.FormatStyle().weekday(.abbreviated))
    }
    
    private var backgroundColor: Color {
        isSelected ? .brandPrimaryViolet5 : (isToday ? .brandPrimaryViolet4 : .black)
    }
}

#Preview {
    let today = Date()
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
    
    ZStack {
        BackgroundPrimaryViolet()
        HStack {
            DayCellView(date: today, selectedDate: .constant(today))//selected
            DayCellView(date: today, selectedDate: .constant(tomorrow)) //today, but not selected
            DayCellView(date: tomorrow, selectedDate: .constant(today)) //not selected and not today
        }
    }
}
