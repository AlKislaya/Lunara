//
//  HoroscopeView.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import SwiftUI

struct HoroscopeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: HoroscopeViewModel
    var selectedDate: Date
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundPrimaryViolet()
            
            if (!viewModel.isLoading) {
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
            } else {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimaryLightViolet))
                }.containerRelativeFrame(Axis.Set.vertical)
            }
        }
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(DateFormatter.fullDateLocalizedMonth.string(from: selectedDate))
                    .font(.chivoHeadingMediumBold)
                    .foregroundStyle(.brandPrimaryLightViolet)
            }
        }
        .alert(isPresented: viewModel.isShowingError,
               error: viewModel.fetchError) {
            Button("OK") {
                dismiss()
            }
        }
    }
    
    init(selectedDate: Date, viewData: HoroscopeViewData) {
        self.selectedDate = selectedDate
        
        _viewModel = StateObject(
            wrappedValue: HoroscopeViewModel(viewData: viewData, with: selectedDate)
        )
    }
}

#Preview {
    HoroscopeView(selectedDate: MockData.horoscopeMockSelectedDate,
                      viewData: HoroscopeViewData(zodiacSign: .virgo))
}

