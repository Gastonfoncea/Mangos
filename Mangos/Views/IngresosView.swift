//
//  IngresosView.swift
//  Mangos
//
//  Created by Gaston Foncea on 17/03/2024.
//

import SwiftUI
import SwiftData

struct IngresosView: View {
    
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
                    
                    Text("Tus Ingresos acumulados")
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
                
                ForEach(vmRegistros.fetchRegistrosPorTipo(tipo: .Ingresos)) {item in
                    ListViewItemCard(descripcion: item.detalle, tipo: item.tipo, monto: item.monto, colorMonto: .green, fecha: item.fecha)
                }
                .onDelete { indexSet in
                    for index in indexSet{
                        vmRegistros.deleteRegistro(tipo: .Ingresos, index: index)
                        suma = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
                        vmRegistros.balance()
                        vmRegistros.sumaIngresos = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
                        vmRegistros.sumaAhorros = vmRegistros.sumarRegistrosPorTipo(tipo: .Ahorros)
                        vmRegistros.sumaGastos = vmRegistros.sumarRegistrosPorTipo(tipo: .Gastos)
                    }
                }
                //.listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)

        }
        .onAppear{
            suma = vmRegistros.sumarRegistrosPorTipo(tipo: .Ingresos)
        }
    }
}

#Preview {
    IngresosView(vmRegistros: RegistrosViewModel())
}
