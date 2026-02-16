//
//  TarotDeckScrollView.swift
//  Lunara
//
//  Created by Alexandra on 9.02.26.
//

import SwiftUI

struct TarotDeckScrollView: View {
    let cardImage: String
    let cardSize: CGSize
    
    @Binding var items: [TarotCard]
    @Binding var dragDropState: DragDropState
    
    var body: some View {
        GeometryReader { scrollGeometry in
            let screenWidth = scrollGeometry.size.width
            let pivot = CGPoint(x: screenWidth / 2, y: scrollGeometry.size.height)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -(cardSize.width / 2)) {
                    ForEach(items, id: \.self) { item in
                        GeometryReader { itemGeo in
                            let midX = itemGeo.frame(in: .global).midX
                            let progress = (midX - pivot.x) / pivot.x
                            
                            Image(cardImage)
                                .resizable()
                                .rotationEffect(.degrees(progress * 30),
                                                anchor: .init(x: (pivot.x - midX) / cardSize.width + 0.5, y: 1))
                                .zIndex(-abs(progress))
                                .opacity(dragDropState.isDragging(with: item) ? 0 : 1)
                                .id(item)
                                .gesture(
                                    DragGesture(minimumDistance: 15)
                                        .onChanged { value in
                                            let globalPoint = itemGeo.frame(in: .global).origin
                                            let point = CGPoint(
                                                x: value.location.x + globalPoint.x,
                                                y: value.location.y + globalPoint.y
                                            )
                                            dragDropState = .dragging(item: item, point: point)
                                        }
                                        .onEnded {_ in
                                            if case let .dragging(item, point) = dragDropState {
                                                dragDropState = .dropped(item: item, point: point)
                                            }
                                        }
                                )

                        }
                        .frame(width: dragDropState.isDragging(with: item) ? cardSize.width / 2 : cardSize.width,
                               height: cardSize.height)
                        .animation(.default, value: dragDropState)
                    }
                }
                .padding(.horizontal, (screenWidth - cardSize.width) / 2)
            }
        }.frame(height: cardSize.height)
    }
}

#Preview {
    TarotTabView()
        .environmentObject(AnimationState())
}
