//
//  ContentView.swift
//  NSCalculator
//
//  Created by Necati Soyata on 4.02.2023.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multipication
}

struct ContentView: View {
    func getSum(num1:Int,num2:Int)->Int {
        print("asasd")
        return num1
    }
    @State var currentValue = "0"
    @State var currentMode:CalculatorMode = .notSet
    @State var lastButtonWasMode:Bool=false
    @State var savedNum = 0
    @State var currentValueInt = 0

    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                TotalText(value:currentValue)
                HStack {
                    CalculatorButton(action:didPressNumber, buttonText: "1")
                    CalculatorButton(action:didPressNumber,buttonText: "2")
                    CalculatorButton(action:didPressNumber,buttonText: "3")
                    CalculatorButton(action:didPressMode,mode: .addition, buttonText: "+",color: .orange    )
            
                }
                HStack {
                    CalculatorButton(action:didPressNumber,buttonText: "4")
                    CalculatorButton(action:didPressNumber,buttonText: "5")
                    CalculatorButton(action:didPressNumber,buttonText: "6")
                    CalculatorButton(action:didPressMode,mode:.subtraction, buttonText: "-", color: .orange   )
            
                }
                HStack {
                    CalculatorButton(action:didPressNumber,buttonText: "7")
                    CalculatorButton(action:didPressNumber,buttonText: "8")
                    CalculatorButton(action:didPressNumber,buttonText: "9")
                    CalculatorButton(action:didPressMode,mode:.multipication, buttonText: "*", color: .orange    )
            
                }
                HStack {
                    CalculatorButton(action:didPressNumber,buttonText: "0",width: 145)
                    CalculatorButton(action:didPressClear,buttonText: "C",color:.gray
                    )
                    CalculatorButton(action:didPressEquals,buttonText: "=",color: .orange)
                  
            
                }
            }
        }
        .ignoresSafeArea()
    }
    func didPressNumber(button:CalculatorButton) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            currentValueInt = 0
            
        }
        if let parsedValue = Int("\(currentValueInt)"+button.buttonText) {
            currentValueInt = parsedValue
        } else {
            currentValue = "Error"
            currentValueInt = 0
        }
       
    }
    func didPressMode(button:CalculatorButton) {
        currentMode=button.mode
        lastButtonWasMode=true
        
    }
    func didPressClear(button:CalculatorButton) {
        currentValue="0"

    }
    func didPressEquals(button:CalculatorButton) {
        if(currentMode == .notSet || lastButtonWasMode ) {
            return
        }
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .subtraction {
            savedNum -= currentValueInt
        } else if currentMode == .multipication {
            savedNum *= currentValueInt
        }
        currentValueInt = savedNum
        updateText()
        lastButtonWasMode = true 
    }
    
    func updateText() {
        if(currentMode == .notSet) {
            savedNum = currentValueInt
        }
        currentValue = "\(currentValueInt)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.device)
            .previewDevice("iPod touch (7th generation)")
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
                .previewLayout(.device)
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
