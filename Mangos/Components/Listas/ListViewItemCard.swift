//
//  ListViewItemCard.swift
//  Mangos
//
//  Created by Gaston Foncea on 16/03/2024.
//

import SwiftUI

struct ListViewItemCard: View {
    
    @StateObject var generalFunc = GeneralFunctions()
    @StateObject var appTheme = AppTheme()
    var descripcion: String
    var tipo: String
    var monto:String
    var colorMonto: Color
    var fecha: Date
    
    var body: some View {
        VStack{
            HStack{
                LogoCirclePorTipo(tipo: tipo)
                VStack(alignment:.leading,spacing: 6){
                    Text(descripcion)
                        .font(.system(size: AppTheme.fontSizeListas))
                        .foregroundStyle(.fontColor1G)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    Text(tipo)
                        .font(.footnote)
                        .foregroundStyle(Color.accentColor)
                        .opacity(0.7)
                        .lineLimit(1)
                }
                .padding(.leading)
                Spacer()
                VStack(alignment: .trailing,spacing: 6){
                    Text("$ \(generalFunc.StringToInt(valor: monto))") //monto
                        .font(.system(size: AppTheme.montosTarjeta))
                        .fontWeight(.medium)
                    Text(generalFunc.DateString(fecha: fecha))
                        .font(.footnote)
                        .foregroundStyle(Color.accentColor)
                        .fontWeight(.semibold)
                        .opacity(0.7)
                        .lineLimit(1)
                }
            }
      
        }
        .frame(height: 60)
        .frame(maxWidth:.infinity)
    }
}

#Preview {
    ListViewItemCard(descripcion: "Sueldo", tipo: "Ingresos", monto: "150.000", colorMonto: Color.green, fecha: Date.now)
}
