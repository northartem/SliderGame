//
//  GameOptions.swift
//  SliderGame
//
//  Created by Артём Латушкин on 22.06.2023.
//

import Foundation

struct GameOptions {
    var targetValue = Int.random(in: 0...100)
    var currentValue = Double.random(in: 0...100)
}
