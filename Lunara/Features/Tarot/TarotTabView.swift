//
//  TarotTabView.swift
//  Lunara
//
//  Created by Alexandra on 8.02.26.
//

import SwiftUI

struct TarotTabView: View {
    @State var items = ["1", "2", "3", "4", "5"]
    @State var droppedItem: String? = nil
    
    var body: some View {
        ZStack {
            BackgroundPrimaryViolet()
            VStack {
                Spacer()
                DropSlotView(itemsCollection: $items, dropItem: $droppedItem)
                Spacer()
                TarotDeckScrollView(items: $items)
            }
        }
    }
}

#Preview {
    TarotTabView()
}
