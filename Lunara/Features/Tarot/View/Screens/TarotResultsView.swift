//
//  TarotResultsView.swift
//  Lunara
//
//  Created by Alexandra on 13.02.26.
//

import SwiftUI

struct TarotResultsView: View {
    let results: TarotCard
    @State var selectedTab: Tab = .general
    
    var body: some View {
        ZStack {
            BackgroundPrimaryViolet()
            ScrollView {
                VStack(spacing: Padding.medium) {
                    HStack {
                        Image(results.imageAssetName)
                            .resizable()
                            .aspectRatio(0.6, contentMode: .fit)
                            .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(Opacity.container), lineWidth: 6)
                    }
                    .frame(maxHeight: 316)
                    
                    Text(results.title)
                        .font(.chivoHeadingMediumBold)
                    TarotResultTags(tags: results.keys)
                    
                    ZStack(alignment: .top) {
                        OpaqueRoundedRectangle(color: .black)
                            .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(Opacity.lightContainer))
                        
                        ZStack {
                            HStack {
                                categoryButton(.general, title: "General")
                                categoryButton(.love, title: "Love")
                                categoryButton(.carrer, title: "Carrer")
                            }
                            .padding(2)
                            .background {
                                OpaqueRoundedRectangle(color: .black)
                            }
                            .roundedRectangleBorder(color: .brandPrimaryLightViolet.opacity(Opacity.lightContainer))
                            .offset(y: -20)
                        }
                        
                        Text(categoryText)
                            .font(.chivoBody2)
                            .padding(Padding.medium)
                            .padding(.top, Padding.medium) //adds medium padding to the current value
                    }
                    .padding(.top, Padding.large)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .title) {
                Text("Results")
                    .font(.chivoHeadingMediumBold)
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .foregroundStyle(.brandPrimaryLightViolet)
    }
    
    private var categoryText: String {
        switch selectedTab {
        case .general:
            results.generalDescription
        case .love:
            results.loveDescription
        case .carrer:
            results.careerDescription
        }
    }
    
    private func categoryButton(_ tab: Tab, title: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            Text(title)
                .font(.chivoButtonMedium)
                .foregroundStyle(.brandPrimaryLightViolet)
                .padding(.horizontal, Padding.medium)
                .padding(.vertical, Padding.standart)
        }
        .background(RoundedRectangle(cornerRadius: AppCornerRadius.medium)
            .fill(selectedTab == tab ? .brandPrimaryViolet4 : .clear))
    }
    
    enum Tab {
        case general, love, carrer
    }
}

#Preview {
    TarotResultsView(results: .strength)
}
