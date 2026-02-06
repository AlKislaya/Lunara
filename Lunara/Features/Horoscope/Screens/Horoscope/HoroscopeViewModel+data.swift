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
        return colors[(data?.lucky.color.key).orEmpty] ?? Color.white
    }
    public var luckyColorText: String {
        return (data?.lucky.color.label).orEmpty
    }
    public var luckyNumberText: String {
        return (data?.lucky.number.description).orEmpty
    }
    public var luckyTimeText: String {
        return (data?.lucky.timeWindow).orEmpty
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
    
    public func score(for score: HoroscopeData.Scores) -> Int {
        guard let safeData = data else {
            return 0
        }
        
        switch score {
        case .love:
            return safeData.scores.love
        case .career:
            return safeData.scores.career
        case .money:
            return safeData.scores.money
        case .health:
            return safeData.scores.health
        case .overall:
            return safeData.scores.overall
        }
    }
}
