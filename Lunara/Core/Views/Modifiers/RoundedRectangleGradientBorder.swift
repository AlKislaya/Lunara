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

struct RoundedRectangleBorder: ViewModifier {
    let cornerRadius: CGFloat
    let lineWidth: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(color, lineWidth: lineWidth)
        )
    }
}
