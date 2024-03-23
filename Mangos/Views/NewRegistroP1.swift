//
//  NewResgistroP1.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import SwiftUI

struct NewRegistroP1: View {
    
    @ObservedObject var vmRegistros: RegistrosViewModel
    @State var tipo: String
    @State var monto: String = ""
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
                .padding(.top,200)
            Spacer()
            
            NavigationLink(destination:NewRegPart2(vmRegistros: vmRegistros, tipo: tipo, monto: monto)) {
             ButtonAceptar(name: "Continuar")
            }
            .padding(.bottom,50)
            
        }
        .navigationTitle("Ingresa el monto")
        .onChange(of: vmRegistros.dimiss) {
            dismiss()
        }
    }
}

#Preview {
    NewRegistroP1(vmRegistros: RegistrosViewModel(), tipo: "Ingresos")
}
