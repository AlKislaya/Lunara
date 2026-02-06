//
//  Fonts+customStyles.swift
//  Lunara
//
//  Created by Alexandra on 1.02.26.
//

import SwiftUI

extension Font {
    private struct ChivoFontNames {
        static let regular = "Chivo-Medium_Regular"
        static let medium = "Chivo-Medium"
        static let semibold = "Chivo-Medium_SemiBold"
        static let bold = "Chivo-Medium_Bold"
    }
    
    static let chivoHeadingSmallBold = Font.custom(ChivoFontNames.bold, size: 18)
    static let chivoHeadingMediumBold = Font.custom(ChivoFontNames.bold, size: 20)
    static let chivoHeadingLargeBold = Font.custom(ChivoFontNames.bold, size: 22)
    
    static let chivoHeadingSmall = Font.custom(ChivoFontNames.medium, size: 18)
    static let chivoHeadingMedium = Font.custom(ChivoFontNames.medium, size: 20)
    
    static let chivoSubHeadingLargeBold = Font.custom(ChivoFontNames.bold, size: 18)
    static let chivoSubHeadingMediumBold = Font.custom(ChivoFontNames.bold, size: 16)
    static let chivoSubHeadingSmallBold = Font.custom(ChivoFontNames.bold, size: 14)
    
    static let chivoBody1 = Font.custom(ChivoFontNames.regular, size: 18)
    static let chivoBody2 = Font.custom(ChivoFontNames.regular, size: 16)
    static let chivoBody3 = Font.custom(ChivoFontNames.regular, size: 14)
    static let chivoBody4 = Font.custom(ChivoFontNames.regular, size: 12)
    
    static let chivoButtonXSmall = Font.custom(ChivoFontNames.semibold, size: 12)
    static let chivoButtonSmall = Font.custom(ChivoFontNames.semibold, size: 14)
    static let chivoButtonMedium = Font.custom(ChivoFontNames.semibold, size: 16)
    static let chivoButtonLarge = Font.custom(ChivoFontNames.semibold, size: 18)
}
