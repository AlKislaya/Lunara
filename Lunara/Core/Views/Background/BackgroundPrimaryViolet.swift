//
//  BackgroundPrimaryViolet.swift
//  Lunara
//
//  Created by Alexandra on 1.02.26.
//

import SwiftUI

struct BackgroundPrimaryViolet : View {
    let gradientStops = [Gradient.Stop(color: .brandPrimaryViolet1, location: 0),
                         Gradient.Stop(color: .brandPrimaryViolet2, location: 0.5),
                         Gradient.Stop(color: .brandPrimaryViolet3, location: 1)]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.brandPrimaryViolet3)
            Rectangle()
                .fill(.ellipticalGradient(
                        stops: gradientStops,
                        center: .top,
                        startRadiusFraction: 0,
                        endRadiusFraction: 1))
                .opacity(Opacity.container)
            Rectangle()
                .fill(
                    ImagePaint(
                        image: Image("Background"),
                        scale: 1
                    )
                )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundPrimaryViolet()
}
