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
    var montoCompra: Int
    var montoVenta: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(Color.whiteAccent)
            
            HStack{
                VStack(alignment: .leading,spacing: 6){
                    //dolar blue
                    Text(tipoDolar.capitalized)
                        .font(.system(size: 20))
                        .bold()
                    Text("Spread $ \(montoVenta - montoCompra)")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.greenG)
                        
                    Text(genFunc.formatedDate(date: actualizacion))
                        .font(.system(size: 13))
                }
                Spacer()
                
                HStack{
                    Spacer()
                    VStack(alignment:.leading,spacing: 6){
                        //compra
                        Text("COMPRA")
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                        //venta
                        Text("$ \(montoCompra)")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            
                    }
                    Spacer()
                    VStack(alignment:.leading, spacing:6){
                        //monto Compra
                        Text("VENTA")
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                        //monto venta
                        Text("$ \(montoVenta)")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    
                }
                
                
                
            }
            .padding(.leading)
            
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .shadow(color: .black.opacity(0.1), radius: 8)
    }
}

#Preview {
    DolarCard(tipoDolar: "blue", spread: 20, actualizacion: "2024-03-28T10:54:00.000Z", montoCompra: 930, montoVenta: 940)
}
