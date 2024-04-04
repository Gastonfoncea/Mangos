//
//  GuitaApp.swift
//  Guita
//
//  Created by Gaston Foncea on 08/03/2024.
//

import SwiftUI
import SwiftData

@main
struct MangosApp: App {
    
    @StateObject var vmRegistros = RegistrosViewModel()
    
    var body: some Scene {
        WindowGroup {
            Home(vmRegistros: vmRegistros)
                .onAppear{
                    vmRegistros.balance()
                    vmRegistros.sumaSoloIngresos()
                    vmRegistros.sumaSoloGastos()
                    vmRegistros.sumaSoloAhorros()
                    vmRegistros.sumaSoloTarjetas()
                }
        }
        
    }
}
