//
//  ContentView.swift
//  Guita
//
//  Created by Gaston Foncea on 08/03/2024.
//

import SwiftUI
import SwiftData

struct Home: View {
    
    @Environment(\.modelContext) var modelContext
    @StateObject var appTheme = AppTheme()
    @StateObject var vmRegistros = RegistrosViewModel()
    
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    HStack{
                        Text("Welcome,")
                            .font(.system(size: 26))
                            .fontWeight(.light)
                            .foregroundStyle(.gray)
                            .padding(.leading,20)
                            .padding(.bottom,10)
                        Text("Gaston!")
                            .font(.system(size: 26))
                            .fontWeight(.light)
                            .padding(.bottom,10)
                    }
                    Spacer()
                }
                
                
                HStack{
                    CardMontoHome(balance: vmRegistros.balanceTotal,ingresos: vmRegistros.sumaIngresos ,egresos: vmRegistros.sumaIngresos)
                }
                
                HStack(spacing:10){
                    NavigationLink(destination:IngresosView(vmRegistros: vmRegistros)){
                        ButtonTipo(tipo: "Ingresos")
                    }
                    NavigationLink(destination:GastosView(vmRegistros: vmRegistros)){
                        ButtonTipo(tipo: "Gastos")
                    }
                    NavigationLink(destination:AhorrosView(vmRegistros: vmRegistros)){
                        ButtonTipo(tipo: "Ahorros")
                    }
                    NavigationLink(destination:TarjetasView(vmRegistros: vmRegistros)){
                        ButtonTipo(tipo: "Tarjetas")
                    }
                   
                  
                   
                }
                .padding(.top,20)
                
                VStack{
                    HStack{
                        Text("Ultimas transacciones")
                            .font(.title3)
                            .fontWeight(.light)
                            .padding(.leading)
                        Spacer()
                        NavigationLink(destination: ListOfMovimientos(vmRegistros: vmRegistros)) {
                            Text("Ver todas")
                                .padding(.trailing)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.blueColorG)
                        }
                    }
                    .padding(.horizontal,10)
                    .padding(.top,20)
                    .padding(.bottom,6)
                    
                    List{
                        ForEach(vmRegistros.fetchRegistrosTotal()) {item in
                            ListHomeItemCard(tipo: item.tipo, descripcion: item.detalle, monto: item.monto)
                        }
                    }
                    .listStyle(.plain)
                    
                }
            }
            .offset(y:45)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination:ListOfRegistros(vmRegistros: vmRegistros)) {
                        PlusButton()
                    }
                    .padding(.bottom,30)
                }
            }
            .toolbarBackground(.hidden, for: .bottomBar)
        }
        .onAppear{
            vmRegistros.balance()
        }
    }
}

#Preview {
    Home()
}
