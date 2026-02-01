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
    }
    
    static let chivoBody1 = Font.custom(ChivoFontNames.regular, size: 18)
    static let chivoBody2 = Font.custom(ChivoFontNames.regular, size: 16)
    static let chivoBody3 = Font.custom(ChivoFontNames.regular, size: 14)
    static let chivoBody4 = Font.custom(ChivoFontNames.regular, size: 12)
}
