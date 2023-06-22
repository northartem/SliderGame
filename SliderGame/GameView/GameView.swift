//
//  GameView.swift
//  SliderGame
//
//  Created by Артём Латушкин on 19.06.2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        VStack {
            GameSliderView(gameViewModel: gameViewModel, color: .red)
            
            HStack {
                ButtonView(
                    title: "Play again",
                    color: .blue,
                    action: gameViewModel.reset
                )
                Spacer()
                ButtonView(
                    title: "Check scores",
                    color: .green,
                    action: gameViewModel.showAlert
                )
                .alert(
                    "Your score",
                    isPresented: $gameViewModel.alertIsPresented,
                    actions: {}
                ) {
                    Text(gameViewModel.score)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
