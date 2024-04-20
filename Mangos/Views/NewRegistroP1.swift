//
//  NewResgistroP1.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import SwiftUI

struct NewRegistroP1: View {
    
    @StateObject var vmNewRegistro = ViewModelNewRegistro()
    @State var tipo: String
    @State var monto: String = ""
    @State var montoFormateado1: String = ""
    @State private var hasEnteredValue = false
    @FocusState private var keyboardFocused: Bool
    @Environment (\.dismiss) private var dismiss
   
    
    var body: some View {
        
        VStack{
            MontoTextfield(referencia: $monto)
                .keyboardType(.numberPad)
                .focused($keyboardFocused)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        keyboardFocused = true
                    }
                }
                .onChange(of: monto) {oldState, value in
                                   // Remover los separadores de miles existentes
                                   let soloNumeros = value.filter { "0123456789".contains($0) }
                                   
                                   // Convertir el string a un número entero
                                   if let montoNumerico = Int(soloNumeros) {
                                       // Crear un NumberFormatter para dar formato al número
                                       let formatter = NumberFormatter()
                                       formatter.numberStyle = .decimal
                                       
                                       // Dar formato al número y asignarlo de nuevo al estado del TextField
                                       if let montoFormateado = formatter.string(from: NSNumber(value: montoNumerico)) {
                                           monto = "$ " + montoFormateado
                                           montoFormateado1 = soloNumeros
                                       }
                                   }
                               }
                .padding(.top,200)
            Spacer()
            
            NavigationLink(destination:NewRegPart2(vmNewR: vmNewRegistro, tipo: tipo, monto: montoFormateado1)) {
             ButtonAceptar(name: "Continuar")
            }
            .onTapGesture {
                vmNewRegistro.monto = monto
            }
            .padding(.bottom,50)
            
        }
        .navigationTitle("Ingresa el monto")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NewRegistroP1(tipo: "Ingresos")
       // .environmentObject(RegistrosViewModel())
}
