//
//  DraggableOverlayCardView.swift
//  Lunara
//
//  Created by Alexandra on 12.02.26.
//

import SwiftUI

struct DraggableOverlayCardView: View {
    let cardImage: String
    let cardSize: CGSize
    
    @Binding var dragDropState: DragDropState
    
    var body: some View {
        Image(cardImage)
            .frame(width: cardSize.width, height: cardSize.height)
            .opacity(dragDropState.isDragging ? 1 : 0)
            .position(dragDropState.isDraggingStatePoint() ?? CGPoint(x: 0, y: 0))
            .ignoresSafeArea()
    }
}
