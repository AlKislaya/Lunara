//
//  ZodiacSign+astroDates.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

extension ZodiacSign {
    public func astroDatesString(format: String) -> String? {
        guard let range = astroDates() else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let rangeString = "\(formatter.string(from: range.lowerBound)) - \(formatter.string(from: range.upperBound))"
        
        return rangeString
    }
    
    public func astroDates() -> ClosedRange<Date>? {
        switch self {
        case .aries:
            return dateRangeIgnoringYear(from: (3, 21), to: (4, 19))
        case .taurus:
            return dateRangeIgnoringYear(from: (4, 20), to: (5, 20))
        case .gemini:
            return dateRangeIgnoringYear(from: (5, 21), to: (6, 20))
        case .cancer:
            return dateRangeIgnoringYear(from: (6, 21), to: (7, 22))
        case .leo:
            return dateRangeIgnoringYear(from: (7, 23), to: (8, 22))
        case .virgo:
            return dateRangeIgnoringYear(from: (8, 23), to: (9, 22))
        case .libra:
            return dateRangeIgnoringYear(from: (9, 23), to: (10, 22))
        case .scorpio:
            return dateRangeIgnoringYear(from: (10, 23), to: (11, 21))
        case .sagittarius:
            return dateRangeIgnoringYear(from: (11, 22), to: (12, 21))
        case .capricorn:
            return dateRangeIgnoringYear(from: (12, 22), to: (1, 19))
        case .aquarius:
            return dateRangeIgnoringYear(from: (1, 20), to: (2, 18))
        case .pisces:
            return dateRangeIgnoringYear(from: (2, 19), to: (3, 20))
        }
    }
    
    private func dateRangeIgnoringYear(from start: (month: Int, day: Int),
                                       to end: (month: Int, day: Int)) -> ClosedRange<Date>? {
        
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: Date())
        
        var startComponents = DateComponents()
        startComponents.year = currentYear
        startComponents.month = start.month
        startComponents.day = start.day
        
        var endComponents = DateComponents()
        endComponents.year = currentYear
        endComponents.month = end.month
        endComponents.day = end.day
        
        guard let startDate = calendar.date(from: startComponents),
              let endDate = calendar.date(from: endComponents) else {
            return nil
        }
        
        // if range is around the end of the year
        if startDate > endDate {
            endComponents.year = currentYear + 1
            guard let newEndDate = calendar.date(from: endComponents) else {
                return nil
            }
            return ClosedRange<Date>(uncheckedBounds: (startDate, newEndDate))
        }
        
        return ClosedRange<Date>(uncheckedBounds: (startDate, endDate))
    }
}
