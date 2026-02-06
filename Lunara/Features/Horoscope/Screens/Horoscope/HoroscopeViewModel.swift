//
//  HoroscopeViewModel.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI
import Combine

final class HoroscopeViewModel: ObservableObject {
    @Published var horoscopeData: HoroscopeData?
    let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    var viewData: HoroscopeViewData
    
    let colors: [String: Color] = [
        "red": .red,
        "blue": .blue,
        "green": .green,
        "yellow": .yellow,
        "orange": .orange,
        "purple": .purple,
        "white": .white
    ]
    
    init(viewData: HoroscopeViewData, selectedDate: Date) {
        self.viewData = viewData
        
        if (isPreview) {
            horoscopeData = MockData.horoscopeMockData
        } else {
            Task {
                do {
                    horoscopeData = try await HoroscopeService.fetchHoroscope(for: viewData.zodiacSign,
                                                                              date: selectedDate)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
