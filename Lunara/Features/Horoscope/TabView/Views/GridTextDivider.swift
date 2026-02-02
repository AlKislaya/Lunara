//
//  GridTextDivider.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct GridTextDivider: View {
    var text: String
    
    var body: some View {
        GridRow {
            HStack {
                Line(startPoint: .leading, endPoint: .trailing)
                
                Text(text)
                    .font(.chivoButtonMedium)
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Line(startPoint: .trailing, endPoint: .leading)
            }
            .gridCellColumns(3)
        }.padding(.vertical)
    }
    
    struct Line: View {
        var startPoint: UnitPoint
        var endPoint: UnitPoint
        
        var body: some View {
            Rectangle()
                .fill(.linearGradient(
                    colors: [.white.opacity(0.2), .white.opacity(0.8)],
                    startPoint: startPoint,
                    endPoint: endPoint))
                .frame(height: 0.5)
        }
    }
}
