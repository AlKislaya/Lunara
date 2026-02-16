//
//  AnimationState.swift
//  Lunara
//
//  Created by Alexandra on 15.02.26.
//

import Combine

class AnimationState: ObservableObject {
    @Published var isAnimatingBlockingUI: Bool = false
}
