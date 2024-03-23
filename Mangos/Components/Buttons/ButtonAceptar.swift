//
//  Button.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct ButtonAceptar: View {
    var name: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.accentColor)
            Text(name)
                .font(.system(size: 20))
                .foregroundStyle(Color.accentColorInvertido)
                .bold()
        }
        .frame(maxWidth:.infinity)
        .frame(height: 55)
        .padding(.horizontal,20)
    }
}

#Preview {
    ButtonAceptar(name: "Aceptar")
}
