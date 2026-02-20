//
//  HoroscopeTitleView.swift
//  Lunara
//
//  Created by Alexandra on 7.02.26.
//

import SwiftUI

struct HoroscopeTitleView: View {
    var zodiacSignText: String
    var zodiacSignAstroDatesText: String
    
    var body: some View {
            VStack {
                Text(zodiacSignText)
                    .font(.chivoHeadingMediumBold)
                Text(zodiacSignAstroDatesText)
                    .font(.chivoSubHeadingMediumBold)
                    .opacity(Opacity.standartText)
            }.foregroundStyle(.brandPrimaryLightViolet)
    }
}
