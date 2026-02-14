//
//  TarotResultTags.swift
//  Lunara
//
//  Created by Alexandra on 14.02.26.
//

import SwiftUI
import Flow

struct TarotResultTags: View {
    let tags: [String]
    
    var body: some View {
        HFlow(horizontalAlignment: .center, verticalAlignment: .top) {
            ForEach(tags, id: \.self) { tag in
                Text(tag.capitalized)
                    .font(.chivoSubHeadingSmallBold)
                    .foregroundStyle(.brandPrimaryLightViolet)
                    .padding(.horizontal, Padding.medium)
                    .padding(.vertical, Padding.standart)
                    .background(
                        Capsule()
                            .fill(.brandPrimaryViolet2)
                    )
            }
        }
    }
}
