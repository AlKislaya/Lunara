//
//  HoroscopeView.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import SwiftUI

struct HoroscopeView: View {
    var selectedDate: Date
    @StateObject var viewModel: HoroscopeViewModel
    let textOpacity = 0.6
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundPrimaryViolet()
            VStack(spacing: 15) {
                VStack {
                    Text(viewModel.zodiacSignText)
                        .font(.chivoHeadingMediumBold)
                    Text(viewModel.zodiacSignAstroDatesText)
                        .font(.chivoSubHeadingMediumBold)
                        .opacity(textOpacity)
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 2)
                
                HStack {
                    VStack(spacing: 8) {
                        VStack {
                            Text("Color")
                                .opacity(textOpacity)
                            Label(viewModel.luckyColorText, systemImage: "seal")
                                .symbolVariant(.fill)
                                .foregroundStyle(viewModel.luckyColor)
                        }
                        
                        VStack {
                            Text("Number")
                                .opacity(textOpacity)
                            Label(String(viewModel.luckyNumberText), systemImage: "bubbles.and.sparkles")
                                .foregroundStyle(.green)
                        }
                        
                        VStack {
                            Text("Time Interval")
                                .opacity(textOpacity)
                            Label(viewModel.luckyTimeText, systemImage: "clock")
                        }
                    }
                    .containerRelativeFrame(.horizontal, count: 10, span: 3, spacing: 0)
                    .font(.chivoSubHeadingSmallBold)
                    .foregroundStyle(.white)
                    
                    Image(viewModel.zodiacSignImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .containerRelativeFrame(.horizontal, count: 10, span: 4, spacing: 0)
                    
                    VStack(spacing: 8) {
                        VStack {
                            Text("Strenghts:")
                            ForEach(viewModel.strenghts, id: \.self) { strenght in
                                Text(strenght)
                            }
                        }
                        
                        VStack {
                            Text("Weaknesses:")
                            ForEach(viewModel.weaknesses, id: \.self) { weakness in
                                Text(weakness)
                            }
                        }
                    }
                    .font(.chivoSubHeadingSmallBold)
                    .containerRelativeFrame(.horizontal, count: 10, span: 3, spacing: 0)
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 2)
                
                HStack {
                    Text("Essential: ")
                        .font(.chivoHeadingMedium)
                    Text(viewModel.contentThemeText)
                        .font(.chivoHeadingMedium)
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 2)
                
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    GridRow {
                        ProgressLabelView(text: HoroscopeData.Scores.love.rawValue,
                                          progress: viewModel.score(for: .love))
                        ProgressLabelView(text: HoroscopeData.Scores.career.rawValue,
                                          progress: viewModel.score(for: .career))
                    }
                    GridRow {
                        ProgressLabelView(text: HoroscopeData.Scores.money.rawValue,
                                          progress: viewModel.score(for: .money))
                        ProgressLabelView(text: HoroscopeData.Scores.health.rawValue,
                                          progress: viewModel.score(for: .health))
                    }
                    GridRow {
                        ProgressLabelView(text: HoroscopeData.Scores.overall.rawValue,
                                          progress: viewModel.score(for: .overall))
                    }.gridCellColumns(2)
                }
                Divider()
                    .background(.white)
                    .frame(height: 2)
                Text(viewModel.contentText)
                    .font(.chivoBody2)
            }
            .padding(.horizontal)
        }
        .foregroundStyle(.white)
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(DateFormatter.fullDateLocalizedMonth.string(from: selectedDate))
                    .font(.chivoHeadingSmallBold)
                    .foregroundStyle(.white)
            }
        }
    }
    
    init(selectedDate: Date, viewData: HoroscopeViewData) {
        self.selectedDate = selectedDate
        _viewModel = StateObject(
            wrappedValue: HoroscopeViewModel(viewData: viewData, selectedDate: selectedDate)
        )
    }
    
    struct ProgressLabelView: View {
        var text: String
        var progress: Int
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(text)
                    .font(.chivoHeadingMedium)
                ProgressView(value: (Float(progress)/100))
                    .tint(.brandPrimaryViolet1)
                Text("\(progress)%")
                    .font(.chivoSubHeadingMediumBold)
                    .opacity(0.6)
            }
        }
    }
    
    struct TextDivider: View {
        var text: String
        
        var body: some View {
            
            HStack {
                Line(startPoint: .leading, endPoint: .trailing)
                
                Text(text)
                    .lineLimit(1)
                    .layoutPriority(1)
                
                Line(startPoint: .trailing, endPoint: .leading)
            }
        }
    }
    
    
    struct Line: View {
        var startPoint: UnitPoint
        var endPoint: UnitPoint
        
        var body: some View {
            Rectangle()
                .fill(.linearGradient(
                    colors: [.white.opacity(0.2), .white.opacity(0.8)],
                    startPoint: startPoint,
                    endPoint: endPoint))
                .frame(height: 0.5)
        }
    }
}

#Preview {
    NavigationStack {
        HoroscopeView(selectedDate: mockSelectedDate,
                      viewData: HoroscopeViewData(zodiacSign: .virgo))
    }
    
    var mockSelectedDate: Date {
        let calendar = Calendar.current
        
        var component = DateComponents()
        component.year = 2025
        component.month = 5
        component.day = 25
        
        return calendar.date(from: component)!
    }
}
