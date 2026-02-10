//
//  DropSlotView.swift
//  Lunara
//
//  Created by Alexandra on 10.02.26.
//

import SwiftUI

struct DropSlotView: View {
    @Binding var itemsCollection: [String]
    @Binding var dropItem: String?
    @State var isDropTargeted = false
    
    var body: some View {
        ZStack {
            OpaqueRoundedRectangle(color: isDropTargeted ? .brandPrimaryBlue : .black)
                .frame(width: 180, height: 300)
                .overlay {
                        Image("BackCard")
                            .resizable()
                            .opacity(dropItem == nil ? 0 : 1)
                            .scaleEffect(dropItem != nil ? 1.0 : 1.1)
                }
        }
        .dropDestination(for: String.self) { droppedItems, location in
            if dropItem != nil {
                return false
            }
            guard let item = droppedItems.first else {
                return false
            }
            withAnimation(.default) {
                dropItem = item
            }
            
            itemsCollection.removeAll { $0 == item }
            return true
        } isTargeted: {
            isDropTargeted = $0
        }
    }
}
