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
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.cardsColorG)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray.opacity(0.1), lineWidth: 0.5)
                )
            HStack{
                VStack(alignment:.leading,spacing: 6){
                    Text(descripcion)
                        .font(.system(size: AppTheme.fontSizeListas))
                        .foregroundStyle(Color.accentColor)
                        .bold()
                        .lineLimit(1)
                    Text(tipo)
                        .font(.footnote)
                        .foregroundStyle(Color.accentColor)
                        .opacity(0.7)
                        .lineLimit(1)
                    
                    Text(generalFunc.DateString(fecha: fecha))
                        .font(.footnote)
                        .foregroundStyle(Color.accentColor)
                        .fontWeight(.semibold)
                        .opacity(0.7)
                        .lineLimit(1)
                }
                Spacer()
                Text("$ \(generalFunc.StringToInt(valor: monto))") //monto
                    .foregroundStyle(appTheme.ColorMontoTarjeta(tipo: tipo))
                    .font(.system(size: AppTheme.montosTarjeta))
                    .bold()
                
            }
            .padding(.horizontal)
        }
        .frame(height: 90)
        .frame(maxWidth:.infinity)


    }
}

#Preview {
    ListViewItemCard(descripcion: "Sueldo", tipo: "Ingresos", monto: "150.000", colorMonto: Color.green, fecha: Date.now)
}
