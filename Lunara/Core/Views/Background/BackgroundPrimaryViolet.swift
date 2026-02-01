//
//  BackgroundPrimaryViolet.swift
//  Lunara
//
//  Created by Alexandra on 1.02.26.
//

import SwiftUI

struct BackgroundPrimaryViolet : View {
    let gradientStops = [Gradient.Stop(color: .brandPrimaryViolet1, location: 0.1),
                         Gradient.Stop(color: .brandPrimaryViolet2, location: 0.4),
                         Gradient.Stop(color: .brandPrimaryViolet3, location: 1)]
    
    var body: some View {
        Rectangle()
            .fill(.radialGradient(
                Gradient(stops: gradientStops),
                center: .top,
                startRadius: 0,
                endRadius: 800)) //dynamic end radius?
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundPrimaryViolet()
}
