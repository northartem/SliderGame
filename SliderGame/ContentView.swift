//
//  ContentView.swift
//  SliderGame
//
//  Created by Артём Латушкин on 19.06.2023.
//

import SwiftUI

struct ContentView: View {
   
    @State private var currentValue = 50.0
    @State private var targetValue = Int.random(in: 1...100)
    @State private var alert = false
    
    var body: some View {
        VStack {
            Text("Move the slider near at: \(targetValue)")
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $currentValue,
                    alpha: computeScore(),
                    color: .red
                )
                Text("100")
            }
            HStack {
                ButtonView(title: "Play again", color: .blue) {
                    targetValue = Int.random(in: 0...100)
                    currentValue = 50
                }
                Spacer()
                ButtonView(title: "Check scores", color: .green) {
                    alert.toggle()
                }
                .alert("Your score", isPresented: $alert, actions: {}) {
                    Text(computeScore().formatted())
                }
            }
        }
        .padding()
    }
}

//MARK: - Score Engine
extension ContentView {
    private func computeScore() -> Int{
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
