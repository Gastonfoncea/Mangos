//
//  TextfieldGeneral.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct TextfieldGeneral: View {
    @State var nombre: String = ""
    @Binding var referencia: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(.colorTextField)

            TextField(nombre, text: $referencia)
                .padding(.leading)
        }
        .frame(maxWidth:.infinity)
        .frame(height: 50)
        .padding(.horizontal,20)
    }
}

//#Preview {
//    TextfieldGeneral(referencia: self.)
//}
