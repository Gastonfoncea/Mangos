//
//  ButtonTipo.swift
//  Mangos
//
//  Created by Gaston Foncea on 20/03/2024.
//

import SwiftUI

struct ButtonTipo: View {
    
    @StateObject var appTheme = AppTheme()
    var tipo: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:8)
                .foregroundStyle(appTheme.colorString(tipo: tipo).opacity(0.9))
            Text(tipo)
                .foregroundStyle(Color.black)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .frame(width: 80,height: 40)
        .shadow(radius: 5)
        
    }
}

#Preview {
    ButtonTipo(tipo: "Ingresos")
}
