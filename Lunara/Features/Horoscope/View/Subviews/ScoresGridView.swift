//
//  ScoresGridView.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI

struct ScoresGridView: View {
    var scores: HoroscopeData.GeneralData.Scores
    
    var body: some View {
        Grid(horizontalSpacing: Padding.medium, verticalSpacing: Padding.medium) {
            GridRow {
                ProgressLabelView(text: HoroscopeData.Scores.love.title,
                                  progress: scores.love)
                ProgressLabelView(text: HoroscopeData.Scores.career.title,
                                  progress: scores.career)
            }
            GridRow {
                ProgressLabelView(text: HoroscopeData.Scores.money.title,
                                  progress: scores.money)
                ProgressLabelView(text: HoroscopeData.Scores.health.title,
                                  progress: scores.health)
            }
            GridRow {
                ProgressLabelView(text: HoroscopeData.Scores.overall.title,
                                  progress: scores.overall,
                                  alignment: .center)
            }.gridCellColumns(2)
        }
        .foregroundStyle(.brandPrimaryLightViolet)
        .padding(.horizontal, Padding.standart)
    }
    
    struct ProgressLabelView: View {
        var text: String
        var progress: Int
        var alignment: HorizontalAlignment = .leading
        
        var body: some View {
            VStack(alignment: alignment) {
                Text(text)
                    .font(.chivoSubHeadingMediumBold)
                ProgressView(value: (Float(progress)/100))
                    .tint(.brandPrimaryViolet1)
                Text("\(progress)%")
                    .font(.chivoSubHeadingSmallBold)
                    .opacity(Opacity.standartText)
            }
            .foregroundStyle(.brandPrimaryLightViolet)
        }
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        ScoresGridView(scores: MockData.horoscopeMockData.data.scores)
    }
}
