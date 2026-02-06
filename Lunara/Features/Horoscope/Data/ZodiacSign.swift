//
//  ZodiacSign.swift
//  Lunara
//
//  Created by Alexandra on 1.02.26.
//

import SwiftUI

enum ZodiacSign: String, CaseIterable, Identifiable, Hashable {
    case aries,
         taurus,
         gemini,
         cancer,
         leo,
         virgo,
         libra,
         scorpio,
         sagittarius,
         capricorn,
         aquarius,
         pisces

    var id: String { rawValue }
}

extension ZodiacSign {
    var title: String {
        rawValue.capitalized
    }

    var imageName: String {
        "ZodiacGirl\(rawValue.capitalized)"
    }
}
