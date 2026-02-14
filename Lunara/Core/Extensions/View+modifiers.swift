//
//  View+modifiers.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

extension View {
    func roundedRectangleGradientBorder(cornerRadius: CGFloat = AppCornerRadius.medium) -> some View {
        modifier(RoundedRectangleGradientBorder(cornerRadius: cornerRadius))
    }
    func roundedRectangleBorder(color: Color, cornerRadius: CGFloat = AppCornerRadius.medium, lineWidth: CGFloat = 1) -> some View {
        modifier(RoundedRectangleBorder(cornerRadius: cornerRadius, lineWidth: lineWidth, color: color))
    }
}
