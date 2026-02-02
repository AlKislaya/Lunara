//
//  RoundedRectangleGradientBorder.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct RoundedRectangleGradientBorder: ViewModifier {
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.whiteLinearGradient, lineWidth: 1)
        )
    }
}
