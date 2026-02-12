//
//  TarotTabView.swift
//  Lunara
//
//  Created by Alexandra on 8.02.26.
//

import SwiftUI

struct TarotTabView: View {
    let cardImage = "BackCard"
    let cardSize: CGSize = CGSize(width: 104, height: 176)
    
    @State var items = ["1", "2", "3", "4", "5"]
    @State var dragDropState: DragDropState = .none
    
    var body: some View {
        ZStack {
            BackgroundPrimaryViolet()
            
            VStack {
                Spacer()
                
                ZStack {
                    OpaqueRoundedRectangle(color: .black)
                        .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(Opacity.lightContainer))
                    
                    
                    DropSlotView(cardImage: cardImage,
                                 text: "Now",
                                 itemsCollection: $items,
                                 dragDropState: $dragDropState)
                    .padding(Padding.medium)
                }
                .padding(Padding.medium)
                .aspectRatio(1.4, contentMode: .fit)
                
                Text("Drag and drop your cards from the deck")
                    .foregroundStyle(.brandPrimaryLightViolet)
                    .font(.chivoSubHeadingMediumBold)
                    .padding(Padding.standart)
                
                Spacer()
                
                TarotDeckScrollView(cardImage: cardImage,
                                    cardSize: cardSize,
                                    items: $items,
                                    dragDropState: $dragDropState)
            }
            
            Image(cardImage)
                .frame(width: cardSize.width, height: cardSize.height)
                .opacity(dragDropState.isDragging ? 1 : 0)
                .position(dragDropState.isDraggingStatePoint() ?? CGPoint(x: 0, y: 0))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    TarotTabView()
}
