//
//  PersonalHoroscopePayloadData.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import Foundation

struct PersonalHoroscopePayloadData: Encodable {
    var birth: PersonalBirthData
    var date: Date
    
    struct PersonalBirthData: Encodable {
        var year: Int
        var month: Int
        var day: Int
        var hour: Int
        var minute: Int
        var city: String
        
        init(date: Date, city: String) {
            let calendar = Calendar.current
            
            year = calendar.component(.year, from: date)
            month = calendar.component(.month, from: date)
            day = calendar.component(.day, from: date)
            hour = calendar.component(.hour, from: date)
            minute = calendar.component(.minute, from: date)
            
            self.city = city
        }
    }
}
