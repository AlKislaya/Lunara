//
//  HoroscopeView.swift
//  Lunara
//
//  Created by Alexandra on 5.02.26.
//

import SwiftUI
import Combine

final class HoroscopeViewModel: ObservableObject {
    @Published var horoscopeData: HoroscopeData?
    var viewData: HoroscopeViewData
    
    init(viewData: HoroscopeViewData, selectedDate: Date) {
        self.viewData = viewData
        
#if DEBUG
        horoscopeData = MockData.horoscopeMockData
#else
        Task {
            do {
                horoscopeData = try await HoroscopeService.fetchHoroscope(for: viewData.zodiacSign, date: selectedDate)
            } catch {
                print(error.localizedDescription)
            }
        }
#endif
    }
}

struct HoroscopeView: View {
    var selectedDate: Date
    @StateObject var viewModel: HoroscopeViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            BackgroundPrimaryViolet()
            VStack(spacing: 15) {
                VStack {
                    Text(viewModel.viewData.zodiacSign.title)
                        .font(.chivoHeadingMediumBold)
                    Text(viewModel.viewData.zodiacSign.astroDatesString(formatter: DateFormatter.dayMonth).orEmpty)
                        .font(.chivoSubHeadingMediumBold)
                        .opacity(0.6)
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 2)
                
                HStack {
                    VStack(spacing: 8) {
                        //TextDivider(text: "Lucky")
                        VStack {
                            Text("Color")
                                .opacity(0.6)
                            Label(viewModel.horoscopeData?.data.lucky.color.label ?? "nill", systemImage: "seal")
                                .symbolVariant(.fill)
                                .foregroundStyle(.yellow)
                        }
                        
                        VStack {
                            Text("Number")
                                .opacity(0.6)
                            Label(String(viewModel.horoscopeData?.data.lucky.number ?? 0), systemImage: "bubbles.and.sparkles")
                                .symbolVariant(.fill)
                                .foregroundStyle(.green)
                        }
                        
                        VStack {
                            Text("Time Interval")
                                .opacity(0.6)
                            Label(viewModel.horoscopeData?.data.lucky.timeWindow ?? "nill", systemImage: "clock")
                        }
                    }
                    .containerRelativeFrame(.horizontal, count: 10, span: 3, spacing: 0)
                    .font(.chivoSubHeadingSmallBold)
                    .foregroundStyle(.white)
                    
                    Image(viewModel.viewData.zodiacSign.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .containerRelativeFrame(.horizontal, count: 10, span: 4, spacing: 0)
                    
                    VStack(spacing: 8) {
                        //                        TextDivider(text: "Do")
                        VStack {
                            Text("Strenghts:")
                            Text("Live")
                            Text("Laught")
                        }
                        VStack {
                            //                        TextDivider(text: "Dont")
                            Text("Weaknesses:")
                            Text("Cry")
                            Text("Die")
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
                    Text(viewModel.horoscopeData?.data.content.theme ?? "nill")
                        .font(.chivoHeadingMedium)
                    //                        .foregroundStyle(.brandPrimaryViolet5)
                    //                    Spacer()
                }
                
                Divider()
                    .background(.white)
                    .frame(height: 2)
                
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    GridRow {
                        ProgressLabelView(text: "Love")
                        ProgressLabelView(text: "Career")
                    }
                    GridRow {
                        ProgressLabelView(text: "Money")
                        ProgressLabelView(text: "Health")
                    }
                    GridRow {
                        ProgressLabelView(text: "Overall")
                    }.gridCellColumns(2)
                }
                Divider()
                    .background(.white)
                    .frame(height: 2)
                Text(viewModel.horoscopeData?.data.content.text ?? "nill")
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
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(text)
                    .font(.chivoHeadingMedium)
                ProgressView(value: 0.9)
                    .tint(.brandPrimaryViolet1)
                Text("90%")
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
