//
//  DropSlotView.swift
//  Lunara
//
//  Created by Alexandra on 10.02.26.
//

import SwiftUI

struct DropSlotView: View {
    let cardImage: String
    let text: String
    @Binding var itemsCollection: [TarotCard]
    @Binding var dragDropState: DragDropState
    @Binding var selectedCard: TarotCard?
    
    var body: some View {
        VStack(spacing: Padding.medium) {
            ZStack {
                OpaqueRoundedRectangle(color: .black)
                    .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(0.2))
                Text("Drag Here")
                    .font(.chivoButtonXSmall)
                    .foregroundStyle(.brandPrimaryLightViolet)
                    .opacity(Opacity.standartText)
                GeometryReader { geo in
                    let frame = geo.frame(in: .global)
                    Image(cardImage)
                        .resizable()
                        .opacity(selectedCard == nil ? 0 : 1)
                        .scaleEffect(selectedCard != nil ? 1.0 : 1.1)
                        .onChange(of: dragDropState) { newState in
                            guard case let .dropped(item, point) = newState else {
                                return
                            }
                            
                            dragDropState = .none
                            
                            if selectedCard != nil || !frame.contains(point) {
                                return
                            }
                            
                            itemsCollection.removeAll(where: { $0 == item })
                            selectedCard = item
                        }
                }
            }
            .aspectRatio(0.58, contentMode: .fit)
            
            Text(text)
                .font(.chivoButtonSmall)
                .foregroundStyle(.brandPrimaryLightViolet)
        }
    }
}

#Preview {
    TarotTabView()
}
