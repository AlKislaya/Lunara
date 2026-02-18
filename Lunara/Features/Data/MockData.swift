//
//  MockData.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct MockData {
    public static let horoscopeMockData = HoroscopeData(data: HoroscopeData.GeneralData(sign: ZodiacSign.virgo.rawValue,
                                                                                        scores: HoroscopeData.GeneralData.Scores(overall: 80,
                                                                                                                                 love: 70,
                                                                                                                                 career: 60,
                                                                                                                                 money: 80,
                                                                                                                                 health: 90),
                                                        lucky: HoroscopeData.GeneralData.Lucky(number: 3,
                                                                                               timeWindow:  HoroscopeData.GeneralData.Lucky.TimeWindow(display: "11am - 1pm"),
                                                                                               color: HoroscopeData.GeneralData.Lucky.Color(key: "green",
                                                                                                                                            label: "Green")),
                                                        content: HoroscopeData.GeneralData.Content(text: "With the Moon in Virgo (Waning Gibbous), the cosmic mood favors detailed planning. For you, this brings a focus on energy. The energy today supports meaningful connection. Trust your instincts as you navigate the day's potential.",
                                                                                                   theme: "Love",
                                                                                                   keywords: ["Live", "Laught"],
                                                                                                   supportingInsights: ["Trust your intuition", "Take small steps"])))
    
    public static let horoscopeMockSelectedDate: Date = {
        let calendar = Calendar.current
        
        var component = DateComponents()
        component.year = 2025
        component.month = 5
        component.day = 25
        
        return calendar.date(from: component)!
    }()
}
