//
//  ButtonCuadrado.swift
//  Mangos
//
//  Created by Gaston Foncea on 29/03/2024.
//

import SwiftUI

struct ButtonCuadrado: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.accentColorInvertido)
            Image(systemName: "line.3.horizontal")
                .scaledToFit()
                .font(.system(size: 22))
                .bold()
        }
        .frame(width: 45,height: 45)
    }
}

#Preview {
    ButtonCuadrado()
}
