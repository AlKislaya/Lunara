//
//  AppStyles.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

extension ShapeStyle where Self == LinearGradient {
    static var whiteLinearGradient: LinearGradient {
        LinearGradient(
            colors: [
                .white.opacity(0.1),
                .white.opacity(0.3)
            ],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
    }
}
