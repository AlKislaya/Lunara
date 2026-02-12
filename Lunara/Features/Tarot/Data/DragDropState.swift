//
//  DragDropState.swift
//  Lunara
//
//  Created by Alexandra on 12.02.26.
//

import SwiftUI

enum DragDropState: Equatable {
    case none
    case dragging(item: TarotCard, point: CGPoint)
    case dropped(item: TarotCard, point: CGPoint)
}

extension DragDropState {
    var isDragging: Bool {
        if case .dragging = self { return true }
        return false
    }
    
    func isDragging(with target: TarotCard) -> Bool {
        if case let .dragging(item, _) = self {
            return item == target
        }
        
        return false
    }
    
    func isDraggingStatePoint() -> CGPoint? {
        if case let .dragging(_, point) = self {
            return point
        }
        
        return nil
    }
}
