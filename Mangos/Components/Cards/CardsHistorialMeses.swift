//
//  CardsHistorialMeses.swift
//  Mangos
//
//  Created by Gaston Foncea on 15/04/2024.
//

import SwiftUI

struct CardsHistorialMeses: View {
    
    @StateObject var generalFunc = GeneralFunctions()
    var mes: String
    var montoIngresos: String
    var montoGastos: String
    var total: Int
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.accentColorInvertido)
            
            VStack(spacing:4){
                
                HStack{
                    Text("Enero 2024")
                        .font(.headline)
                    Spacer()
                }
                .padding(.bottom,6)
                HStack{
                    Text("Ingresos totales")
                        .font(.footnote)
                    Spacer()
                    Text("$ \(generalFunc.StringToInt(valor: montoIngresos))")
                        .font(.footnote)
                }
                
                HStack{
                    Text("Gastostotales")
                        .font(.footnote)
                    Spacer()
                    Text("$ \(generalFunc.StringToInt(valor: montoGastos))")
                        .font(.footnote)
                }
                .padding(.bottom,4)
                
                Divider()
                
                HStack{
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text("$ \(total))")
                        .font(.headline)
                }
                .padding(.top,4)
                
            }
            .padding()
        }
        .frame(height: 140)
        .frame(maxWidth:.infinity)
       
    }
}

#Preview {
    CardsHistorialMeses(mes: "Enero 2024", montoIngresos: "1200000", montoGastos: "800000", total: 1234123)
}
