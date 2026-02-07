//
//  EssetialsView.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct EssentialsView: View {
    var contentThemeText: String
    var strenghts: [String]
    var weaknesses: [String]
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: .brandPrimaryViolet2)
            
            VStack(spacing: Padding.medium) {
                Text("Essential: \(contentThemeText)")
                    .foregroundStyle(.brandPrimaryViolet4)
                    .font(.chivoHeadingMediumBold)
                
                Divider()
                    .background(.brandPrimaryLightViolet)
                
                HStack(spacing: Padding.medium) {
                    EssentialsAdviceView(header: "Do:",
                                         headerColor: .brandGreen,
                                         advices: strenghts)
                    
                    EssentialsAdviceView(header: "Avoid:",
                                         headerColor: .brandRed,
                                         advices: weaknesses)
                }
                .foregroundStyle(.brandPrimaryLightViolet)
            }
            .padding(Padding.medium)
        }.roundedRectangleGradientBorder()
    }
    
    struct EssentialsAdviceView: View {
        var header: String
        var headerColor: Color
        var advices: [String]
        
        var body: some View {
            ZStack(alignment: .topLeading) {
                OpaqueRoundedRectangle(color: .brandPrimaryViolet3)
                VStack(alignment: .leading, spacing: Padding.standart) {
                    Text(header)
                        .font(.chivoSubHeadingMediumBold)
                        .foregroundStyle(headerColor)
                    Text(advices.joined(separator: ", "))
                        .font(.chivoSubHeadingSmallBold)
                        .opacity(Opacity.standartText)
                }
                .padding(Padding.medium)
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        ScrollView {
            EssentialsView(contentThemeText: MockData.horoscopeMockData.data.content.theme,
                           strenghts: MockData.horoscopeMockData.data.content.strengths,
                           weaknesses: MockData.horoscopeMockData.data.content.weaknesses)
        }
    }
}
