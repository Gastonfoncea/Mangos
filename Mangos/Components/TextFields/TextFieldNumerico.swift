//
//  TextFieldNumerico.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import SwiftUI

struct TextFieldNumerico: View {
    
    let name: String
    @Binding var referencia: Int
    var fontSize: CGFloat = 25
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(.colorTextField)

            HStack{
                Text("$")
                    .padding(.leading)
                    .font(.system(size: fontSize))
                    .fontWeight(.semibold)
                TextField(name, value: ($referencia),formatter: NumberFormatter())
                    .font(.system(size: fontSize))
                    .foregroundStyle(.fontColor1G)
                    .fontWeight(.semibold)
                    .padding(.leading)
            }
        }
        .frame(maxWidth:.infinity)
        .frame(height: 50)
        .padding(.horizontal,20)
    }
}


//#Preview {
//    TextFieldNumerico()
//}
