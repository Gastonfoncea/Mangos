//
//  ListOfRegsitros.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import SwiftUI

struct ListOfRegistros: View {
    
    @EnvironmentObject var vmRegistros: RegistrosViewModel
    @State private var registros = RegistrosList.listarRegistros()
    @Environment (\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            Form{
                Section(header: Text("Selecciona una Categoria").textCase(nil)){
                    List(registros, id: \.name) {registro in
                        NavigationLink(destination:NewRegistroP1(tipo: registro.name)){
                            HStack{
                                ZStack{
                                    Circle()
                                        .foregroundStyle(registro.color)
                                        .frame(width: 45)
                                    Image(systemName: registro.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                        .foregroundStyle(.white)
                                }
                                Text(registro.name)
                                    .foregroundStyle(.fontColor1G)
                                    .fontWeight(.semibold)
                                    .font(.system(size: AppTheme.fontSizeListas))
                                    .padding(.leading)
                            }
                        }
                    }
                }
                .font(.title3)
                .foregroundStyle(.fontColor1G)
                .bold()
            }
        }
        .navigationTitle("Categoria")
    }
      
}

#Preview {
    ListOfRegistros()
        .environmentObject(RegistrosViewModel())
}
