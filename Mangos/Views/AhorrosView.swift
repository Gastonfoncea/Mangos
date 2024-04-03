//
//  AhorrosView.swift
//  Mangos
//
//  Created by Gaston Foncea on 18/03/2024.
//

import SwiftUI

struct AhorrosView: View {
    
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
                    
                    Text("Tus Ahorros acumulados")
                        .font(.system(size: 20))
                        .padding(.top,3)
                        .bold()
                    
                    Text("$ \(vmRegistros.sumaAhorros)")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .listRowSeparator(.hidden, edges: .top)
                .padding(.vertical, 16)
                
                ForEach(vmRegistros.fetchRegistrosPorTipo(tipo: .Ahorros)) {item in
                    ListViewItemCard(descripcion: item.detalle, tipo: item.tipo, monto: item.monto, colorMonto: .greenG, fecha: item.fecha)
                }
                .onDelete { indexSet in
                    for index in indexSet{
                        vmRegistros.deleteRegistro(tipo: .Ahorros, index: index)
                        suma = vmRegistros.sumarRegistrosPorTipo(tipo: .Ahorros)
                        vmRegistros.balance()
                        vmRegistros.sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
                        vmRegistros.sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .Ahorros)
                        vmRegistros.sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
                        
                    }
                }
                
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)

        }


    }
}

#Preview {
    AhorrosView(vmRegistros: RegistrosViewModel())
}
