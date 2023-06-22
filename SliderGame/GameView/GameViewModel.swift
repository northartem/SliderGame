//
//  GameViewModel.swift
//  SliderGame
//
//  Created by Артём Латушкин on 22.06.2023.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var gameOption = GameOptions()
    @Published var alertIsPresented = false
    
    var score: String {
        (100 - abs(gameOption.targetValue - lround(gameOption.currentValue))).formatted()
    }
    
    var alpha: Double {
        (100 - abs(Double(gameOption.targetValue) - gameOption.currentValue)) / 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        gameOption.currentValue = Double.random(in: 0...100)
        gameOption.targetValue = Int.random(in: 0...100)
    }
}
