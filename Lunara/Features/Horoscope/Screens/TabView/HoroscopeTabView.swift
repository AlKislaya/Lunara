//
//  HoroscopeTabView.swift
//  Lunara
//
//  Created by Alexandra on 31.01.26.
//

import SwiftUI

struct HoroscopeTabView: View {
    private var viewModel = HoroscopeTabViewModel()
    @StateObject var datePickerViewModel = DatePickerViewModel()
    
    var body: some View {
        ScrollView {
            DatePickerView(viewModel: datePickerViewModel)
            Grid {
                GridTextDivider(text: "Personal")
                
                GridRow {
                    Spacer()
                    ZodiacSignGridItemView(sign: .virgo) //replace with account sign
                }
                
                GridTextDivider(text: "Select sign")
                
                ForEach(viewModel.zodiacSignsRows.indices, id: \.self) { row in
                    GridRow {
                        ForEach(viewModel.zodiacSignsRows[row], id: \.self) { sign in
                            NavigationLink(value: sign) {
                                ZodiacSignGridItemView(sign: sign) //or can be replaced by $0
                            }
                        }
                    }
                }
            }.padding(.horizontal)
        }
        .navigationDestination(for: ZodiacSign.self) { sign in
            HoroscopeView(selectedDate: datePickerViewModel.selectedDate,
                          viewData: HoroscopeViewData(zodiacSign: sign))
        }
    }
}

#Preview {
    NavigationStack {
        ZStack {
            BackgroundPrimaryViolet()
            HoroscopeTabView()
        }
    }
}
