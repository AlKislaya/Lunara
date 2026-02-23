//
//  DatePickerViewModel.swift
//  Lunara
//
//  Created by Alexandra on 3.02.26.
//

import SwiftUI
import Combine

final class DatePickerViewModel: ObservableObject {
    
    @Published var selectedDate: Date
    
    private static let daysRange = 60
    private static var baseDate: Date = Calendar.current.startOfDay(for: Date())
    let calendar = Calendar.current
    
    init() {
        selectedDate = DatePickerViewModel.baseDate
    }
    
    func availableDays() -> [Date] {
        //if date changed
        if (!calendar.isDateInToday(DatePickerViewModel.baseDate)) {
            DatePickerViewModel.baseDate = Calendar.current.startOfDay(for: Date())
        }
        
        return (-DatePickerViewModel.daysRange ..< DatePickerViewModel.daysRange).compactMap {
            calendar.date(byAdding: .day, value: $0, to: DatePickerViewModel.baseDate)
        }
    }
}
