//
//  TarotDeckScrollView.swift
//  Lunara
//
//  Created by Alexandra on 9.02.26.
//

import SwiftUI

struct TarotDeckScrollView: View {
    let cardImage = "BackCard"
    let cardWidth: CGFloat = 100
    let cardHeight: CGFloat = 172
    @Binding var items: [String]
    
    var body: some View {
        GeometryReader { scrollGeometry in
            let screenWidth = scrollGeometry.size.width
            let pivot = CGPoint(x: screenWidth / 2, y: scrollGeometry.size.height)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -(cardWidth / 2)) {
                    ForEach(items, id: \.self) { item in
                        GeometryReader { itemGeo in
                            let midX = itemGeo.frame(in: .global).midX
                            let progress = (midX - pivot.x) / pivot.x
                            
                            Image(cardImage)
                                .rotationEffect(.degrees(progress * 30),
                                                anchor: .init(x: (pivot.x - midX)/cardWidth + 0.5, y: 1))
                                .zIndex(-abs(progress))
                        }
                        .frame(width: cardWidth, height: cardHeight)
                        .id(item)
                        .draggable(item) {
                            Image(cardImage)
                                .resizable()
                                .frame(width: cardWidth, height: cardHeight)
                        }
                    }
                }
                .padding(.horizontal, (screenWidth - cardWidth) / 2)
            }
        }.frame(height:cardHeight)
    }
}

#Preview {
    TarotTabView()
}
