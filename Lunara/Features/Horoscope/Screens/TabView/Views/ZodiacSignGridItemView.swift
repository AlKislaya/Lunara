//
//  ZodiacSignGridItemView.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct ZodiacSignGridItemView : View {
    var sign: ZodiacSign
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: .black)
            
            VStack(spacing: Padding.standart) {
                Image(sign.imageName)
                Text(sign.title)
                    .font(.chivoButtonSmall)
                    .foregroundStyle(.brandPrimaryLightViolet)
            }.padding(Padding.standart)
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
