//
//  LogoWarning.swift
//  Mangos
//
//  Created by Gaston Foncea on 23/03/2024.
//

import SwiftUI

struct LogoWarning: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(Color.redG)
                .frame(width: 30)
               Text("!")
                .foregroundStyle(.white)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
        }
    }
}

#Preview {
    LogoWarning()
}
