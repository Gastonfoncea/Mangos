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
    @ObservedObject var vmRegistros: RegistrosViewModel
    @State private var showMenu = false
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                VStack{
                    HStack{
                        CardMontoHome(balance: vmRegistros.balanceTotal,ingresos: vmRegistros.sumaIngresos ,egresos: vmRegistros.sumaEgresos)
                    }
                    .padding(.horizontal,20)
                    HStack(spacing:10){
                        NavigationLink(destination:IngresosView(vmRegistros: vmRegistros)){
                            ButtonTipo(tipo: Categorias.ingresos.rawValue)
                        }
                        NavigationLink(destination:GastosView(vmRegistros: vmRegistros)){
                            ButtonTipo(tipo: Categorias.gastos.rawValue)
                        }
                        NavigationLink(destination:AhorrosView(vmRegistros: vmRegistros)){
                            ButtonTipo(tipo: Categorias.ahorros.rawValue)
                        }
                        NavigationLink(destination:TarjetasView(vmRegistros: vmRegistros)){
                            ButtonTipo(tipo: Categorias.tarjetas.rawValue)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal,20)
                    .padding(.top,20)
                    
                    VStack{
                        HStack{
                            Text("Ultimas transacciones")
                                .font(.title3)
                                .fontWeight(.medium)
                            
                            Spacer()
                            NavigationLink(destination: ListOfMovimientos(vmRegistros: vmRegistros)) {
                                Text("Ver todas")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.blueColorG)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal,20)
                        .padding(.top,20)
                        .padding(.bottom,0)
                        
                        List{
                            ForEach(vmRegistros.fetchRegistrosTotal()) {item in
                                ListViewItem2(descripcion: item.detalle, tipo: item.tipo, monto: item.monto, categoria: item.categoria, fecha: item.fecha)
                                    .listRowInsets(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 20))
                            }
                            .listRowSeparator(.hidden)
                        }
                        .padding(.top,-10)
                        .listStyle(.plain)
                    }
                }
                .offset(y:25)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        NavigationLink(destination:ListOfRegistros(vmRegistros: vmRegistros)) {
                            PlusButton()
                                .opacity(showMenu ? 0 : 1)
                        }
                        .animation(nil)
                        .padding(.bottom,30)
                    }
                    
                }
                SideMenuView(isShowing: $showMenu)
            }
            //.toolbar(showMenu ? .hidden : .visible ,for: .tabBar )
            .toolbarBackground(.hidden, for: .bottomBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showMenu.toggle()
                    } label: {
                        ButtonCuadrado()
                            .opacity(showMenu ? 0 : 1)
                    }
                    
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            vmRegistros.balance()
            vmRegistros.sumaSoloIngresos()
            vmRegistros.sumaSoloGastos()
            vmRegistros.sumaSoloAhorros()
            vmRegistros.sumaSoloTarjetas()
        }
    }
}

#Preview {
    Home(vmRegistros: RegistrosViewModel())
}
