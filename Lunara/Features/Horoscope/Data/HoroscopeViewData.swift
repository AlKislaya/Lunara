//
//  HoroscopeViewData.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct HoroscopeViewData {
    let zodiacSign: ZodiacSign
    let personalBirthDate: Date?
    let personalBirthCity: String?
    
    init(zodiacSign: ZodiacSign,
         personalBirthDate: Date? = nil,
         personalBirthCity: String? = nil) {
        self.zodiacSign = zodiacSign
        self.personalBirthDate = personalBirthDate
        self.personalBirthCity = personalBirthCity
    }
}
