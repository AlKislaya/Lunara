//
//  BlackRoundedRectangle.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct BlackRoundedRectangle: View {
    let cornerRadius: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.black.opacity(0.5))
    }
}
