//
//  ButtonView.swift
//  SliderGame
//
//  Created by Артём Латушкин on 20.06.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 40)
        .background(color)
        .cornerRadius(10)
       
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1)
            
        }
        .padding(.top, 20)
    }
    
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Текст", color: .blue, action: {})
    }
}
