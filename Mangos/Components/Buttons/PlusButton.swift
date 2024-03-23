//
//  PlusButton.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 65,height: 65)
                .foregroundStyle(Color.accentColor)

            Image(systemName: "plus")
                .foregroundStyle(Color.blackWhite)
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding()
        .shadow(radius: 6)
    }
}

#Preview {
    PlusButton()
}
