//
//  SideMenuRowView.swift
//  Mangos
//
//  Created by Gaston Foncea on 30/03/2024.
//

import SwiftUI

struct SideMenuRowView: View {
     
    @State var isSelected: Bool = false
    
    var body: some View {
        HStack{
            Image(systemName: "dollarsign")
                .imageScale(.small)
                .foregroundStyle(Color.accentColor)
            
            Text("Dolares")
                .font(.subheadline)
                .foregroundStyle(Color.accentColor)
            
            Spacer()
        }
        .padding(.leading)
        .frame(width: 216, height: 44)
        .background(isSelected ? Color.accentColor.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
           isSelected = true
        }
        
    }
}

#Preview {
    SideMenuRowView()
}
