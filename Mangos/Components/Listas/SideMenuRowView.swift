//
//  SideMenuRowView.swift
//  Mangos
//
//  Created by Gaston Foncea on 30/03/2024.
//

import SwiftUI

struct SideMenuRowView: View {
     
    var icono: String
    var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "\(icono)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.accentColor)
            
            Text(text)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.accentColor)
            Spacer()
        }
       // .padding(.leading)
        .frame(width: 216, height: 44)
        .clipShape(RoundedRectangle(cornerRadius: 10))

    }
}

#Preview {
    SideMenuRowView(icono: Iconos.dolar.rawValue, text: "dolares")
}
