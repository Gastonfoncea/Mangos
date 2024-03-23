//
//  TopCardContainerHome.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct TopCardContainerHome: View {
    var body: some View {
        HStack{
            Text("Ultimas transacciones")
                .font(.title3)
                .fontWeight(.light)
               
            Spacer()
            ZStack{
                Circle()
                    .frame(width: 50)
                Image(systemName: "arrow.up.forward")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        .padding(.trailing,20)
        .padding(.leading,20)
        .padding(.top,20)
    }
}

#Preview {
    TopCardContainerHome()
}
