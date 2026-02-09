//
//  TarotTabView.swift
//  Lunara
//
//  Created by Alexandra on 8.02.26.
//

import SwiftUI

struct TarotTabView: View {
    
    var body: some View {
        ZStack {
            BackgroundPrimaryViolet()
            VStack {
                Spacer()
                TarotDeckScrollView()
            }.ignoresSafeArea(edges: .bottom)
        }
    }
}



#Preview {
    TarotTabView()
}
