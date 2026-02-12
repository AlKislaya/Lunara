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
    
    @State var items = TarotCard.allCases.shuffled()
    @State var dragDropState: DragDropState = .none
    @State var selectedCard: TarotCard? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundPrimaryViolet()
                
                VStack(spacing: Padding.standart) {
                    Spacer()
                    HowToTarotDescription().padding(Padding.medium)
                    
                    ZStack {
                        OpaqueRoundedRectangle(color: .black)
                            .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(Opacity.lightContainer))
                        
                        
                        DropSlotView(cardImage: cardImage,
                                     text: "Now",
                                     itemsCollection: $items,
                                     dragDropState: $dragDropState,
                                     selectedCard: $selectedCard)
                        .padding(Padding.medium)
                    }
                    .padding(Padding.medium)
                    .aspectRatio(1.4, contentMode: .fit)
                    
                    Text("Drag and drop your cards from the deck")
                        .foregroundStyle(.brandPrimaryLightViolet)
                        .font(.chivoSubHeadingMediumBold)
                    
                    Spacer()
                    
                    TarotDeckScrollView(cardImage: cardImage,
                                        cardSize: cardSize,
                                        items: $items,
                                        dragDropState: $dragDropState)
                }
                
                DraggableOverlayCardView(cardImage: cardImage,
                                         cardSize: cardSize,
                                         dragDropState: $dragDropState)
            }
        }
    }
}

#Preview {
    TarotTabView()
}
