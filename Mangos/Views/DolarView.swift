//
//  DolarView.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import SwiftUI

struct DolarView: View {
    
    @StateObject var vmDolar = DolarViewModel()
    
    var body: some View {
        VStack(spacing:20){
            HStack{
                Text("Precio Dolar hoy")
                    .font(.system(size: 22))
                    .bold()
                Spacer()
            }
           
                
            if let dolardata = vmDolar.dolarDataBlue {
                DolarCard(tipoDolar: dolardata.casa, spread: 20, actualizacion: dolardata.fechaActualizacion, montoCompra: dolardata.compra, montoVenta: dolardata.venta)
                } else {
                    ProgressView()
            }
            
            if let dolarOficial = vmDolar.dolarDataOficial {
                DolarCard(tipoDolar: dolarOficial.casa, spread: 20, actualizacion: dolarOficial.fechaActualizacion, montoCompra: dolarOficial.compra, montoVenta: dolarOficial.venta)
            } else {
                ProgressView()
            }
            
//            if let dolarTarjeta = vmDolar.dolarDataTarjeta {
//                DolarCard(tipoDolar: dolarTarjeta.casa, spread: 20, actualizacion: dolarTarjeta.fechaActualizacion, montoCompra: dolarTarjeta.compra, montoVenta: dolarTarjeta.venta)
//            } else {
//                ProgressView()
//            }
            
            Spacer()
        }
        .padding(.horizontal,20)
        .padding(.top,50)
        .onAppear{
            vmDolar.fetchDataDolarBlue()
            vmDolar.fetchDataDolarOficial()
           // vmDolar.fetchDataDolarTarjeta()
        }
        
    }
        
}

#Preview {
    DolarView()
}
