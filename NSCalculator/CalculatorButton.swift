//
//  CalculatorButton.swift
//  NSCalculator
//
//  Created by Necati Soyata on 4.02.2023.
//

import SwiftUI

struct CalculatorButton: View {
    var action: (CalculatorButton) -> Void = {_ in }
    var mode : (CalculatorMode) = .notSet
    var buttonText:String = "1"
    var color:Color=Color(hue: 1.0, saturation: 0.0,brightness:0.283)
    var width:CGFloat=70
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius :50))

        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
