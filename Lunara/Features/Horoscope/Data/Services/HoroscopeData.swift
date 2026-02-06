//
//  HoroscopeData.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import Foundation

struct HoroscopeData: Decodable {
    var data: GeneralData
    
    struct GeneralData: Decodable {
        var sign: String
        var scores: Scores
        var lucky: Lucky
        var content: Content
        
        struct Scores: Decodable {
            let overall: Int
            let love: Int
            let career: Int
            let money: Int
            let health: Int
        }
        
        struct Lucky: Decodable {
            var number: Int
            var timeWindow: String
            var color: Color
            
            struct Color: Decodable {
                var key: String
                var label: String
            }
            enum CodingKeys: String, CodingKey {
                case number
                case timeWindow = "time_window"
                case color
            }
        }
        
        struct Content: Decodable {
            var text: String
            var theme: String
            var keywords: [String]
            var strengths: [String]
            var weaknesses: [String]
            
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
