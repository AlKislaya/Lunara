//
//  DropSlotView.swift
//  Lunara
//
//  Created by Alexandra on 10.02.26.
//

import SwiftUI

struct DropSlotView: View {
    let backCardImage: String
    let text: String
    @EnvironmentObject var animationState: AnimationState
    @Binding var itemsCollection: [TarotCard]
    @Binding var dragDropState: DragDropState
    @Binding var selectedCard: TarotCard?
    
    @State var cardImage: String
    @State var scale: CGFloat = 1
    @State var opacity: CGFloat = 0
    @State var rotation: CGFloat = 180
    
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
                        .opacity(opacity)
                        .scaleEffect(scale)
                        .rotation3DEffect(
                            Angle(degrees: rotation),
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            perspective: 0.5
                        )
                        .onChange(of: dragDropState) { newState in
                            guard case let .dropped(item, point) = newState else {
                                return
                            }
                            
                            dragDropState = .none
                            
                            if selectedCard != nil || !frame.contains(point) {
                                return
                            }
                            
                            itemsCollection.removeAll(where: { $0 == item })
                            cardAnimation(item)
                        }
                }
            }
            .aspectRatio(0.58, contentMode: .fit)
            
            Text(text)
                .font(.chivoButtonSmall)
                .foregroundStyle(.brandPrimaryLightViolet)
        }
    }
    
    private func cardAnimation(_ item: TarotCard) -> Task<(), any Error> {
        return Task {
            //block ui
            animationState.isAnimatingBlockingUI = true
            
            //show, scale and half rotate
            withAnimation(Animation.easeIn(duration: 0.5)) {
                scale = 1.1
                opacity = 1
            }
            try await Task.sleep(nanoseconds: 300_000_000)
            withAnimation(Animation.easeIn(duration: 0.5)) {
                rotation = 90
            }
            try await Task.sleep(nanoseconds: 700_000_000)
            
            //change image and finish rotation
            cardImage = item.imageAssetName
            withAnimation(Animation.easeIn(duration: 0.5)) {
                rotation = 0
            }
            try await Task.sleep(nanoseconds: 500_000_000)
            
            //put card back on the table
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                scale = 1
            }
            try await Task.sleep(nanoseconds: 700_000_000)
            
            //select cart to open results screen
            selectedCard = item
            
            //reset values
            animationState.isAnimatingBlockingUI = false
            cardImage = backCardImage
            scale = 1
            opacity = 0
            rotation = 180
        }
    }
    
    init(backCardImage: String, text: String, itemsCollection: Binding<[TarotCard]>, dragDropState: Binding<DragDropState>, selectedCard: Binding<TarotCard?>) {
        self.backCardImage = backCardImage
        self.text = text
        self._itemsCollection = itemsCollection
        self._dragDropState = dragDropState
        self._selectedCard = selectedCard
        self.cardImage = backCardImage
    }
}

#Preview {
    TarotTabView()
        .environmentObject(AnimationState())
}
