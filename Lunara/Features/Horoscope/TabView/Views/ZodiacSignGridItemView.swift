//
//  ZodiacSignGridItemView.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct ZodiacSignGridItemView : View {
    var sign: ZodiacSignGridItem
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: .black)
            
            VStack(spacing: 8) {
                Image(sign.imageName)
                Text(sign.title)
                    .font(.chivoBody4)
                    .foregroundStyle(.white)
            }.padding()
        }
        .aspectRatio(0.8, contentMode: .fit)
        .roundedRectangleGradientBorder()
    }
}


#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        Grid {
            GridRow {
                ZodiacSignGridItemView(sign: .virgo)
                ZodiacSignGridItemView(sign: .taurus)
                ZodiacSignGridItemView(sign: .cancer)
            }
        }
    }
}
