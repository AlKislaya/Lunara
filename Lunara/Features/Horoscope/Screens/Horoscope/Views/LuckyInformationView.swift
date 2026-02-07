//
//  LuckyInformationView.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct LuckyInformationView: View {
    var lucky: HoroscopeData.GeneralData.Lucky
    var color: Color
    var zodiacSignImageName: String
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: .brandPrimaryViolet2)
            
            HStack {
                VStack(spacing: Padding.standart) {
                    VStack {
                        Text("Color")
                            .opacity(Opacity.standartText)
                        Label(lucky.color.label, systemImage: "seal")
                            .symbolVariant(.fill)
                            .foregroundStyle(color)
                    }
                    
                    VStack {
                        Text("Number")
                            .opacity(Opacity.standartText)
                        Label(String(lucky.number), systemImage: "bubbles.and.sparkles")
                            .symbolVariant(.fill)
                            .foregroundStyle(.brandGreen)
                    }
                    
                    VStack {
                        Text("Time Interval")
                            .opacity(Opacity.standartText)
                        Label(lucky.timeWindow, systemImage: "clock")
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.5 - Padding.large)
                .font(.chivoSubHeadingSmallBold)
                .foregroundStyle(.brandPrimaryLightViolet)
                
                Image(zodiacSignImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.5 - Padding.large)
                
            }.padding(Padding.standart)
        }.roundedRectangleGradientBorder()
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        ScrollView {
            LuckyInformationView(lucky: MockData.horoscopeMockData.data.lucky,
                                 color: .green,
                                 zodiacSignImageName: ZodiacSign.aries.imageName)
        }
    }
}
