//
//  DatePickerr.swift
//  Lunara
//
//  Created by Alexandra on 2.02.26.
//

import SwiftUI

struct DatePickerView: View {
    @ObservedObject var viewModel: DatePickerViewModel
    
    var body: some View {
        VStack {
            DatePickerHeaderView(selectedDate: viewModel.selectedDate)
            
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())]) {
                        
                        ForEach(viewModel.availableDays(), id:\.self) { date in
                            
                            DayCellView(date: date, selectedDate: $viewModel.selectedDate)
                                .id(date)
                                .onTapGesture {
                                    viewModel.selectedDate = date
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            proxy.scrollTo(viewModel.selectedDate, anchor: .center)
                                        }
                                    }
                                }
                        }
                    }
                    .scrollTargetLayout()
                    .onAppear() {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            proxy.scrollTo(viewModel.selectedDate, anchor: .center)
                        }
                    }
                }
                .aspectRatio(CGSize(width: 1, height: 0.2), contentMode: .fit)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    ZStack {
        BackgroundPrimaryViolet()
        DatePickerView(viewModel: DatePickerViewModel())
    }
}
