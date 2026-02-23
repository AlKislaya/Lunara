//
//  HoroscopeViewModel.swift
//  Lunara
//
//  Created by Alexandra on 6.02.26.
//

import SwiftUI
import Combine

final class HoroscopeViewModel: ObservableObject {
    var viewData: HoroscopeViewData
    @Published var horoscopeData: HoroscopeData?
    @Published var isLoading = true
    
    @Published var fetchError: HoroscopeError?
    var isShowingError: Binding<Bool> {
        Binding {
            self.fetchError != nil
        } set: { _ in
            self.fetchError = nil
        }
    }
    
    let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
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
        
        Task {
            do {
                if (isPreview) {
                    //throw HoroscopeError.swiftError(description: "Error description", code: 1000)
                    try await Task.sleep(nanoseconds: 1_000_000_000)
                    horoscopeData = MockData.horoscopeMockData
                } else {
                    horoscopeData = try await HoroscopeService.fetchHoroscope(for: viewData.zodiacSign,
                                                                              date: date)
                }
                
                withAnimation {
                    isLoading = false
                }
            } catch {
                if (error is HoroscopeError) {
                    fetchError = error as? HoroscopeError
                } else {
                    let nsError = error as NSError
                    fetchError = HoroscopeError.nsError(description: error.localizedDescription,
                                                           code: nsError.code)
                }
                //isLoading = false ??
            }
        }
    }
}
