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
    @Published var isLoading = true
    let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    var viewData: HoroscopeViewData
    
    let defaultColor: Color = .white
    let colors: [String: Color] = [
        "red": .red,
        "blue": .blue,
        "green": .green,
        "yellow": .yellow,
        "orange": .orange,
        "purple": .purple,
        "white": .white
    ]
    
    init(viewData: HoroscopeViewData, with date: Date) {
        self.viewData = viewData
        fetchHoroscope(for: date)
    }
    
    public func fetchHoroscope(for date: Date) {
        isLoading = true
        
        if (isPreview) {
            Task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                horoscopeData = MockData.horoscopeMockData
                withAnimation {
                    isLoading = false
                }
            }
        } else {
            Task {
                do {
                    horoscopeData = try await HoroscopeService.fetchHoroscope(for: viewData.zodiacSign,
                                                                              date: date)
                    withAnimation {
                        isLoading = false
                    }
                } catch {
                    print(error.localizedDescription)
                    //isLoading = false ??
                }
            }
        }
    }
}
