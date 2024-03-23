//
//  LogoCirclePorTipo.swift
//  Mangos
//
//  Created by Gaston Foncea on 13/03/2024.
//

import SwiftUI

struct LogoCirclePorTipo: View {
    
    @StateObject var appTheme = AppTheme()
    var tipo: String
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(appTheme.colorString(tipo: tipo))
                .frame(width: 38)
            Image(systemName: appTheme.IconoString(tipo: tipo))
                .resizable()
                .scaledToFit()
                .frame(width: 18)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LogoCirclePorTipo(tipo: "Ingresos")
}

