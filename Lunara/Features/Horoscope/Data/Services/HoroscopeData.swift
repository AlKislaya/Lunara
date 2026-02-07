//
//  HoroscopeData.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import Foundation

struct HoroscopeData: Decodable {
    var data: GeneralData = GeneralData()
    
    struct GeneralData: Decodable {
        var sign: String = ""
        var scores: Scores = Scores()
        var lucky: Lucky = Lucky()
        var content: Content = Content()
        
        struct Scores: Decodable {
            var overall: Int = 0
            var love: Int = 0
            var career: Int = 0
            var money: Int = 0
            var health: Int = 0
        }
        
        struct Lucky: Decodable {
            var number: Int = 0
            var timeWindow: String = ""
            var color: Color = Color()
            
            struct Color: Decodable {
                var key: String = ""
                var label: String = ""
            }
            enum CodingKeys: String, CodingKey {
                case number
                case timeWindow = "time_window"
                case color
            }
        }
        
        struct Content: Decodable {
            var text: String = ""
            var theme: String = ""
            var keywords: [String] = [String]()
            var strengths: [String] = [String]()
            var weaknesses: [String] = [String]()
            
            enum CodingKeys: String, CodingKey {
                case text
                case theme
                case keywords
                case strengths = "do"
                case weaknesses = "dont"
            }
        }
    }
    
    enum Scores: String, RawRepresentable {
        case love, career, money, health, overall
        
        public var title: String {
            rawValue.capitalized
        }
    }
}
