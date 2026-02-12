//
//  HowToTarotDescription.swift
//  Lunara
//
//  Created by Alexandra on 12.02.26.
//

import SwiftUI

struct HowToTarotDescription: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Padding.standart) {
            Text("How to Ask a Tarot Question:")
                .foregroundStyle(.brandPrimaryLightViolet)
                .font(.chivoSubHeadingLargeBold)
                .opacity(Opacity.standartText)
            
            Text("Focus on yourself and the situation. Ask clearly and calmly about guidance or insight, not a fixed outcome, and accept any answer as useful. Draw a card from the deck when you are ready.")
                .foregroundStyle(.brandPrimaryLightViolet)
                .font(.chivoSubHeadingMediumBold)
        }
    }
}
