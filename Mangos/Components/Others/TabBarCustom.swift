//
//  TabBarCustom.swift
//  Guita
//
//  Created by Gaston Foncea on 10/03/2024.
//

import Foundation
import SwiftUI

struct TabBarCustom: View {
    
    @Binding var index: Int
    var tamFuente: CGFloat = 32
    var body: some View {
        
        HStack{
            Button(action: {
                self.index = 0
                
            }, label: {
                Image(systemName: "house.fill")
                    .font(.system(size: tamFuente))
                    .foregroundStyle(.black.opacity(self.index == 0 ? 1 : 0.4))
                    .padding(.leading,50)
                    .padding(.top,30)
            })
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
                
            }, label: {
                PlusButton()
            })
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
                
            }, label: {
                Image(systemName: "person.fill")
                    .font(.system(size: tamFuente))
                    .foregroundStyle(.black.opacity(self.index == 2 ? 1 : 0.4))
                    .padding(.trailing,50)
                    .padding(.top,30)
                    
            })
            
        }
        
        
    }
}
