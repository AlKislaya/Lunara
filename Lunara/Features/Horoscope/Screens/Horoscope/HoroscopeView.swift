//
//  HoroscopeView.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import SwiftUI

struct HoroscopeView: View {
    @StateObject var viewModel: HoroscopeViewModel
    var selectedDate: Date
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundPrimaryViolet()
            
            ScrollView {
                VStack(spacing: Padding.medium) {
                    VStack {
                        Text(viewModel.zodiacSignText)
                            .font(.chivoHeadingMediumBold)
                        Text(viewModel.zodiacSignAstroDatesText)
                            .font(.chivoSubHeadingMediumBold)
                            .opacity(Opacity.standartText)
                    }.foregroundStyle(.brandPrimaryLightViolet)
                    
                    LuckyInformationView(lucky: viewModel.lucky,
                                         color: viewModel.luckyColor,
                                         zodiacSignImageName: viewModel.zodiacSignImageName)
                    
                    EssentialsView(contentThemeText: viewModel.contentThemeText,
                                   strenghts: viewModel.strenghts,
                                   weaknesses: viewModel.weaknesses)
                    
                    ScoresGridView(scores: viewModel.scores)
                    
                    HoroscopeContentView(text: viewModel.contentText)
                }.padding(.horizontal, Padding.standart)
            }
            .toolbar {
                ToolbarItem(placement: .title) {
                    Text(DateFormatter.fullDateLocalizedMonth.string(from: selectedDate))
                        .font(.chivoHeadingMediumBold)
                        .foregroundStyle(.brandPrimaryLightViolet)
                }
            }
        }
    }
    
    init(selectedDate: Date, viewData: HoroscopeViewData) {
        self.selectedDate = selectedDate
        _viewModel = StateObject(
            wrappedValue: HoroscopeViewModel(viewData: viewData, selectedDate: selectedDate)
        )
    }
}

#Preview {
    HoroscopeView(selectedDate: MockData.horoscopeMockSelectedDate,
                      viewData: HoroscopeViewData(zodiacSign: .virgo))
}

