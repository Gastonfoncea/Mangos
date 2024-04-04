//
//  ListOfMovimientos.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct ListOfMovimientos: View {
    
    @ObservedObject var generalFunc = GeneralFunctions()
    @ObservedObject var vmRegistros: RegistrosViewModel
    @State var suma = 0
    
    var body: some View {
        VStack {
            List {
                VStack {
                    Text(generalFunc.getTodayDate())
                        .padding(.top,3)
                        .font(.system(size: 20))
                        .foregroundStyle(.gray)
                    
                    Text("Tus Registros")
                        .font(.system(size: 20))
                        .padding(.top,3)
                        .bold()
                    
                    Text("$ \(vmRegistros.balanceTotal)")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowSeparator(.hidden, edges: .top)
                .padding(.vertical, 16)
                
                ForEach(vmRegistros.fetchRegistrosTotal()) {item in
                    ListViewItemCard(descripcion: item.detalle, tipo: item.tipo, monto: item.monto, colorMonto: Color.blackAndWhite, categoria: item.categoria, fecha: item.fecha)
                }
                
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
       
        }
        
    }
}

#Preview {
    ListOfMovimientos(vmRegistros: RegistrosViewModel())
}
