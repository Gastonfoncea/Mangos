//
//  MontoTextfield.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import SwiftUI

struct MontoTextfield: View {
    
    @State var monto: String = ""
    @Binding var referencia: String

    
    var body: some View {
        HStack{
            TextField("$ 0,00", text: $referencia)
                .font(.system(size: 60))
                .multilineTextAlignment(.center)
        }
       
        
    }
}

//#Preview {
//    MontoTextfield (referencia: "100")
//}
