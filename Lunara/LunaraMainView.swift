//
//  LunaraMainView.swift
//  Lunara
//
//  Created by Alexandra on 31.01.26.
//

import SwiftUI

struct LunaraMainView: View {
    @EnvironmentObject var animationState: AnimationState
    
    var body: some View {
        ZStack {
            TabView {
                HoroscopeTabView()
                    .tabItem {
                        Label("Horoscope", image: "PlanetIcon")
                    }
                TarotTabView()
                    .tabItem {
                        Label("Tarot", image: "TarotIcon")
                    }
            }
        }
        .disabled(animationState.isAnimatingBlockingUI)
        .tint(.brandPrimaryViolet5)
    }
}

#Preview {
    LunaraMainView()
        .environmentObject(AnimationState())
}
