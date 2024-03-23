//
//  PlusButton2.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct PlusButton2: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.accentColor)
            
            Image(systemName: "plus")
                .font(.system(size: 40))
                .fontWeight(.semibold)
                .foregroundStyle(Color.accentColorInvertido)
        }
        .frame(width: 80,height: 120)
    }
}

#Preview {
    PlusButton2()
}
