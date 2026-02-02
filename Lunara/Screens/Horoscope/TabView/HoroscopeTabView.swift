//
//  HoroscopeTabView.swift
//  Lunara
//
//  Created by Alexandra on 31.01.26.
//

import SwiftUI

struct HoroscopeTabView: View {
    @State private var viewModel = HoroscopeTabViewModel()
    
    var body: some View {
        ScrollView {
            Grid {
                GridTextDivider(text: "Personal")
                
                GridRow {
                    Spacer()
                    ZodiacSignGridItemView(sign: .taurus) //replace with account sign
                }
                
                GridTextDivider(text: "Select sign")
                
                ForEach(viewModel.zodiacSignsRows.indices, id: \.self) { row in
                    GridRow {
                        ForEach(viewModel.zodiacSignsRows[row], id: \.self) { sign in
                            ZodiacSignGridItemView(sign: sign) //or can be replaced by $0
                        }
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        HoroscopeTabView()
    }
}
