//
//  ColorCards.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct ColorCards: View {
    
    var tamLetraMonto: CGFloat = 25
    var colorCard: Color
    var icono: String
    var tipo: String
    
    

    var body: some View {
       
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(colorCard)
          
            VStack{
                HStack{
                    ZStack{
                        Circle()
                            .frame(width:42,height: 42)
                            .foregroundStyle(Color.black.opacity(0.3))
                
                        Image(systemName: icono)
                            .foregroundStyle(.white)
                    }
                    Text(tipo)
                        //.padding(.top)
                }
                .padding(.top)
                .padding(.trailing,20)
                .padding(.leading,8)
                Spacer()
                Text("$ 2.500.0")
                    .font(.system(size: tamLetraMonto))
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            
                Spacer()
            }
        }
        .frame(width: 155,height: 150)
    }
}

#Preview {
    ColorCards(colorCard: .greenColorG, icono: "dock.arrow.down.rectangle",tipo: "Ingresos")
}
