//
//  HoroscopeContentView.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct HoroscopeContentView: View {
    var text: String
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: .brandPrimaryViolet3)
            
            VStack(alignment: .leading, spacing: Padding.standart) {
                Text("General description:")
                    .font(.chivoSubHeadingMediumBold)
                    .opacity(Opacity.standartText)
                Text(text)
                    .font(.chivoBody2)
            }
            .padding(Padding.medium)
        }
        .foregroundStyle(.brandPrimaryLightViolet)
        .roundedRectangleGradientBorder()
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        ScrollView {
            HoroscopeContentView(text: MockData.horoscopeMockData.data.content.text)
        }
    }
}
