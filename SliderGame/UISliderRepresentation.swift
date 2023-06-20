//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by Артём Латушкин on 20.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator, action: #selector(Coordinator.changeValue), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

//MARK: - Coordinator
extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(50), alpha: 100, color: .red)
    }
}
