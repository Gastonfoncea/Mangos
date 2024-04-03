//
//  ListViewItem2.swift
//  Mangos
//
//  Created by Gaston Foncea on 01/04/2024.
//

import SwiftUI

struct ListViewItem2: View {
    
    @StateObject var generalFunc = GeneralFunctions()
    @StateObject var appTheme = AppTheme()
    var descripcion: String
    var tipo: String
    var monto:String
    var fecha: Date
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.accentColorInvertido)
            
            HStack{
                //Logo redondo
                LogoCirclePorTipo(tipo: tipo)
               
                VStack(alignment: .leading,spacing: 1){
                    Text(descripcion)
                        .font(.headline)
                        .foregroundStyle(.fontColor1G)
                        .lineLimit(1)
                    
                    Text(tipo)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .lineLimit(1)
                }
                .padding(.leading,10)
                
                Spacer()
                
                VStack(alignment:.trailing,spacing: 1){
                    Text("$ \(generalFunc.StringToInt(valor: monto))") //monto
                        .fontWeight(.medium)
                    Text(generalFunc.DateString(fecha: fecha))
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal,20)
        }
        .frame(maxWidth:.infinity)
        .frame(height: 70)
       // .padding(.horizontal,20)
    }
}

#Preview {
    ListViewItem2(descripcion: "Sueldo", tipo: "Ingresos", monto: "150.000", fecha: Date.now)
}
