//
//  CardContainer.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct CardContainer: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.cardsColorG)
        }
        .frame(width: 360,height: 410)

    }
}

#Preview {
    CardContainer()
}
