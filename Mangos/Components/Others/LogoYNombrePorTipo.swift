//
//  LogoYNombrePorTipo.swift
//  Mangos
//
//  Created by Gaston Foncea on 03/04/2024.
//

import SwiftUI

struct LogoYNombrePorTipo: View {
    
    @StateObject var appTheme = AppTheme()
    var tipo: String
    
    var body: some View {
        
        VStack {
            ZStack{
                Circle()
                    .foregroundStyle(appTheme.colorString(tipo: tipo))
                    .frame(width: 50)
                Image(systemName: appTheme.IconoString(tipo: tipo))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundStyle(.white)
            }
            Text("\(tipo)")
                .font(.footnote)
        }
    }
}

#Preview {
    LogoYNombrePorTipo(tipo: "Sueldo")
}
