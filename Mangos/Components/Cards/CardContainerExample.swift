//
//  CardContainer.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct CardContainerExample: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.cardsColorG)
        
            VStack{
                
                HStack{
                    Text("Ultimas transacciones")
                        .font(.title3)
                        .fontWeight(.light)
                       
                    Spacer()
                    ZStack{
                        Circle()
                            .frame(width: 50)
                        Image(systemName: "arrow.up.forward")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                .padding(.trailing,20)
                .padding(.leading,20)
                .padding(.top,20)
                
                Spacer()
                VStack{
                    HStack{
                        ColorCards(colorCard: .greenColorG, icono: "dock.arrow.down.rectangle", tipo: "Ingresos")
                        ColorCards(colorCard: .violetColorG, icono: "dock.arrow.down.rectangle", tipo: "Gastos")
                    }
                    
                    HStack{
                        ColorCards(colorCard: .orangeColorG, icono: "dock.arrow.down.rectangle", tipo: "Ahorros")
                        ColorCards(colorCard: .blueColorG, icono: "dock.arrow.down.rectangle", tipo: "Tarjetas")
                        
                    }
                }
                .padding(.bottom)
            }
        }
        .frame(width: 360,height: 410)
    
    }
}

#Preview {
    CardContainerExample()
}
