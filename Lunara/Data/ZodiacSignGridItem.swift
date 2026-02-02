//
//  ZodiacSignGridItem.swift
//  Lunara
//
//  Created by Alexandra on 1.02.26.
//

import SwiftUI

enum ZodiacSignGridItem: String, CaseIterable, Identifiable {
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

    var title: String {
        rawValue.capitalized
    }

    var imageName: String {
        "ZodiacGirl\(rawValue.capitalized)"
    }
}
