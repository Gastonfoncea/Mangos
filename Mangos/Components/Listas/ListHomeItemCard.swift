//
//  ListHomeItemCard.swift
//  Mangos
//
//  Created by Gaston Foncea on 20/03/2024.
//

import SwiftUI

struct ListHomeItemCard: View {
    
    @State var tipo: String
    @State var descripcion: String
    @State var monto: String
    @StateObject var generalFunc = GeneralFunctions()
    
    var body: some View {
        HStack{
            ZStack{
                LogoCirclePorTipo(tipo: tipo)
            }
            VStack(alignment:.leading){
                Text("\(descripcion)")
                    .foregroundStyle(.fontColor1G)
                    .fontWeight(.medium)
                    .font(.system(size: AppTheme.fontSizeListas))
                    .padding(.leading)
                Text("\(tipo)")
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                    .font(.footnote)
                    .padding(.leading)
            }
            Spacer()
            VStack{
                Text("$ \(generalFunc.StringToInt(valor: monto))")
                    .font(.system(size: AppTheme.montosTarjeta))
                    .fontWeight(.medium)
                    .padding(.bottom)
            }
            
        }
        .padding(.vertical,2)
        
    }
}

#Preview {
    ListHomeItemCard(tipo: "Ingresos", descripcion: "Suelasdasdo", monto: "120000")
}
