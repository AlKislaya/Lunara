//
//  BlackRoundedRectangle.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct OpaqueRoundedRectangle: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: AppCornerRadius.medium)
            .fill(color.opacity(0.5))
    }
}
