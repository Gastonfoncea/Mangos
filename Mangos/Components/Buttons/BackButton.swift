//
//  BackButton.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/04/2024.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack{
            Image(systemName: "chevron.backward")
                .bold()
            Text("Back")
        }
    }
}

#Preview {
    BackButton()
}
