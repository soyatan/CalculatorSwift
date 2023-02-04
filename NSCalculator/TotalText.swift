//
//  TotalText.swift
//  NSCalculator
//
//  Created by Necati Soyata on 4.02.2023.
//

import SwiftUI

struct TotalText: View {
    var value:String = "0"
    var body: some View {
        Text(value)
            .padding(12)
            .font(.system(size: 70))
            .foregroundColor(.white)
            .lineLimit(1)
           
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
            .background(.black)
    }
}
