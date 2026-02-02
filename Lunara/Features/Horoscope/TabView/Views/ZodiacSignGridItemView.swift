//
//  ZodiacSignGridItemView.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct ZodiacSignGridItemView : View {
    var sign: ZodiacSignGridItem
    
    let cornerRadius: Double = 12
    let gradient = LinearGradient(colors: [.white.opacity(0.1), .white.opacity(0.3)],
                                  startPoint: .bottomLeading,
                                  endPoint: .topTrailing)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.black.opacity(0.5))
            
            VStack(spacing: 8) {
                Image(sign.imageName)
                Text(sign.title)
                    .font(.chivoBody4)
                    .foregroundStyle(.white)
            }.padding()
        }
        .aspectRatio(0.8, contentMode: .fit)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(gradient, lineWidth: 1)
        )
    }
}
