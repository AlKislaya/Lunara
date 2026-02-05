//
//  DatePickerHeaderView.swift
//  Lunara
//
//  Created by Alexandra on 3.02.26.
//

import SwiftUI

struct DatePickerHeaderView: View {
    let selectedDate: Date
    
    var body: some View {
        HStack {
            Text(dayAbbreviation)
            Spacer()
            Text(weekTitle)
        }
        .font(.chivoHeadingSmall)
        .foregroundStyle(.white)
        .padding(.horizontal)
    }
    
    private var dayAbbreviation: String {
        selectedDate.formatted(Date.FormatStyle().weekday(.abbreviated))
    }
    
    private var weekTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        
        return formatter.string(from: selectedDate)
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        DatePickerHeaderView(selectedDate: Date())
    }
}
