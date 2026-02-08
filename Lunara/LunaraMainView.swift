//
//  LunaraMainView.swift
//  Lunara
//
//  Created by Alexandra on 31.01.26.
//

import SwiftUI

struct LunaraMainView: View {
    var body: some View {
        TabView {
            HoroscopeTabView()
                .tabItem {
                    Label("Horoscope", image: "PlanetIcon")
                }
        }
        .tint(.brandPrimaryViolet5)
    }
}

#Preview {
    LunaraMainView()
}
