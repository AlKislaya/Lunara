//
//  HoroscopeViewModel+data.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

extension HoroscopeViewModel {
    
    private var data: HoroscopeData.GeneralData? {
        horoscopeData?.data
    }
    
    public var zodiacSignText: String {
        return viewData.zodiacSign.title
    }
    public var zodiacSignImageName: String {
        return viewData.zodiacSign.imageName
    }
    public var zodiacSignAstroDatesText: String {
        return viewData.zodiacSign.astroDatesString(formatter: DateFormatter.dayMonth).orEmpty
    }
    
    public var luckyColor: Color {
        return colors[(data?.lucky.color.key).orEmpty] ?? defaultColor
    }
    public var lucky: HoroscopeData.GeneralData.Lucky {
        guard let safeData = data else {
            return HoroscopeData.GeneralData.Lucky()
        }
        
        return safeData.lucky
    }
    
    public var strenghts: [String] {
        return data?.content.strengths ?? [String]()
    }
    public var weaknesses: [String] {
        return data?.content.weaknesses ?? [String]()
    }
    
    public var contentText: String {
        return (data?.content.text).orEmpty
    }
    public var contentThemeText: String {
        return (data?.content.theme).orEmpty
    }
    
    public var scores: HoroscopeData.GeneralData.Scores {
        guard let safeData = data else {
            return HoroscopeData.GeneralData.Scores()
        }
        
        return safeData.scores
    }
}
