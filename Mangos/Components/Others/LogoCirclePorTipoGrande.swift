//
//  LogoCirclePorTipoGrande.swift
//  Mangos
//
//  Created by Gaston Foncea on 01/04/2024.
//

import SwiftUI

struct LogoCirclePorTipoGrande: View {
    
    @StateObject var appTheme = AppTheme()
    var tipo: String
    var body: some View {
        
        ZStack{
            Circle()
                .foregroundStyle(appTheme.colorString(tipo: tipo))
                .frame(width: 40)
            Image(systemName: appTheme.IconoString(tipo: tipo))
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LogoCirclePorTipoGrande(tipo: "Gastos")
}
