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
            Text(DateFormatter.localizedMonthDay.string(from: selectedDate))
        }
        .font(.chivoHeadingSmall)
        .foregroundStyle(.white)
        .padding(.horizontal)
    }
    
    private var dayAbbreviation: String {
        selectedDate.formatted(Date.FormatStyle().weekday(.abbreviated))
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        DatePickerHeaderView(selectedDate: Date())
    }
}
