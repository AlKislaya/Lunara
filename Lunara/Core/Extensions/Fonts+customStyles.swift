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
        static let semibold = "Chivo-Medium_SemiBold"
    }
    
    static let chivoBody1 = Font.custom(ChivoFontNames.regular, size: 18)
    static let chivoBody2 = Font.custom(ChivoFontNames.regular, size: 16)
    static let chivoBody3 = Font.custom(ChivoFontNames.regular, size: 14)
    static let chivoBody4 = Font.custom(ChivoFontNames.regular, size: 12)
    
    static let chivoButtonSmall = Font.custom(ChivoFontNames.semibold, size: 14)
    static let chivoButtonMedium = Font.custom(ChivoFontNames.semibold, size: 16)
    static let chivoButtonLarge = Font.custom(ChivoFontNames.semibold, size: 18)
}
