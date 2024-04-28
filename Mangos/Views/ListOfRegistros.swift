//
//  ListOfRegsitros.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import SwiftUI

struct ListOfRegistros: View {
    
    @EnvironmentObject var vmRegistros: RegistrosViewModel
    @EnvironmentObject var viewFlow: ViewFlowData
    @State private var registros = RegistrosList.listarRegistros()
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Selecciona una Categoria").textCase(nil)){
                    List(registros, id: \.name) {registro in
                            Button {
                                viewFlow.tipo = registro.name
                                viewFlow.navigateToNewRegP1()
                            } label: {
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
        .environmentObject(ViewFlowData())
}
