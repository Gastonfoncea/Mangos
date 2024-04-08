//
//  DolarCard.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import SwiftUI

struct DolarCard: View {
    
    
    @StateObject var genFunc = GeneralFunctions()
    var tipoDolar: String
    var spread: Int
    var actualizacion: String
    var montoCompra: Decimal
    var montoVenta: Decimal
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.accentColorInvertido)
            
            HStack{
                VStack(alignment: .leading,spacing: 4){
                    //dolar blue
                    Text(tipoDolar.capitalized)
                        .font(.headline)
                        .bold()
                    Text("Spread $ \(montoVenta - montoCompra)")
                        .font(.footnote)
                        .foregroundStyle(Color.greenColorG)
                        
                    Text(genFunc.formatedDate(date: actualizacion))
                        .font(.footnote)
                }
                Spacer()
                
                HStack{
                    Spacer()
                    VStack(alignment:.leading,spacing: 17){
                        //compra
                        Text("Compra")
                            .font(.headline)
                            .fontWeight(.medium)
                       
                        //venta
                        Text("$ \(montoCompra)")
                            .font(.headline)
                            .fontWeight(.semibold)
                           // .padding(.top,3)
                            
                    }
                    Spacer()
                    VStack(alignment:.leading, spacing:17){
                  
                        Text("Venta")
                            .font(.headline)
                            .fontWeight(.medium)
                 
                        Text("$ \(montoVenta)")
                            .font(.headline)
                            .fontWeight(.semibold)
                         
                    }
                    Spacer()
                    
                }
            }
            .padding(.leading)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 85)

    }
}

#Preview {
    DolarCard(tipoDolar: "blue", spread: 20, actualizacion: "2024-03-28T10:54:00.000Z", montoCompra: 930, montoVenta: 940)
}
