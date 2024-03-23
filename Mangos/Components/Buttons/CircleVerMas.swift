//
//  CircleVerMas.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct CircleVerMas: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 40)
                .foregroundStyle(Color.accentColor)
            Image(systemName: "arrow.up.forward")
                .foregroundStyle(.accentColorInvertido)
                .bold()
        }
    }
}

#Preview {
    CircleVerMas()
}
