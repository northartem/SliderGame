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
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $currentValue,
                    alpha: computeScore(),
                    color: .red
                )
                Text("100")
            }
            .padding(.bottom, 20)
            Button("Проверь меня") {
                alert.toggle()
            }
            .padding(.bottom, 10)
            .alert("Твой счет", isPresented: $alert, actions: {}) {
                Text(computeScore().formatted())
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 50
            }
        }
        .padding()
    }
}

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
