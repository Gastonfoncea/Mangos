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
                .foregroundStyle(Color.accentColorInvertido)
            Text(tipo)
                .foregroundStyle(appTheme.colorString(tipo: tipo))
                .font(.footnote)
                .fontWeight(.bold)
        }
        .frame(maxWidth: 95)
        .frame(height: 40)
        
        
    }
}

#Preview {
    ButtonTipo(tipo: "Ingresos")
}
