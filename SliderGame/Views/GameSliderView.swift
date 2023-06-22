//
//  GameSliderView.swift
//  SliderGame
//
//  Created by Артём Латушкин on 22.06.2023.
//

import SwiftUI

struct GameSliderView: View {
    @ObservedObject var gameViewModel: GameViewModel
    var color: UIColor
    
    var body: some View {
        VStack {
            let targetValue = gameViewModel.gameOption.targetValue
            Text("Move the slider near at: \(targetValue)")
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $gameViewModel.gameOption.currentValue,
                    alpha: gameViewModel.alpha,
                    color: color
                )
                Text("100")
            }
        }
    }
}

struct GameSliderView_Previews: PreviewProvider {
    static var previews: some View {
        GameSliderView(gameViewModel: GameViewModel(), color: .blue)
    }
}
