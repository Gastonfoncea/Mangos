//
//  GastosView.swift
//  Mangos
//
//  Created by Gaston Foncea on 17/03/2024.
//

import SwiftUI

struct GastosView: View {
    
    @ObservedObject var vmRegistros: RegistrosViewModel
    @StateObject var generalFunc = GeneralFunctions()
    @State var suma = 0
    
    var body: some View {
        VStack{
            List {
                VStack {
                    Text(generalFunc.getTodayDate())
                        .padding(.top,3)
                        .font(.system(size: 20))
                        .foregroundStyle(.gray)
                    
                    Text("Tus Gastos acumulados")
                        .font(.system(size: 20))
                        .padding(.top,3)
                        .bold()
                    
                    Text("$ \(suma)")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowSeparator(.hidden, edges: .top)
                .padding(.vertical, 16)
                
                ForEach(vmRegistros.fetchRegistrosPorTipo(tipo: .Gastos)) {item in
                    ListViewItemCard(descripcion: item.detalle, tipo: item.tipo, monto: item.monto, colorMonto: .redG, fecha: item.fecha)
                }
                .onDelete { indexSet in
                    for index in indexSet{
                        vmRegistros.deleteRegistro(tipo: .Gastos, index: index)
                        suma = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
                        
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)

        }
        .onAppear{
            suma = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
            vmRegistros.balance()
        }
    }
}

#Preview {
    GastosView(vmRegistros: RegistrosViewModel())
}
