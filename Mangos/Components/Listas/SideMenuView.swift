//
//  SideMenuView.swift
//  Mangos
//
//  Created by Gaston Foncea on 29/03/2024.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationStack {
            ZStack{
                if isShowing {
                    Rectangle()
                        .foregroundStyle(.colorMenu.opacity(0.3))
                        .ignoresSafeArea()
                        .onTapGesture { isShowing.toggle() }
                    
                    HStack {
                        VStack(alignment:.leading ,spacing: 32) {
                            SideMenuHeaderView()
                            VStack{
                                NavigationLink(destination:DolarView()) {
                                    SideMenuRowView(icono: Iconos.dolar.rawValue, text: "Precio Dolar Hoy")
                                }
                                
                                NavigationLink(destination:Profile()) {
                                    SideMenuRowView(icono: Iconos.profile.rawValue, text: "Perfil")
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(width:240,alignment: .leading)
                        .background(Color.colorMenu)
                        
                        
                        Spacer()
                    }
                    
                }
            }
            .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
        }
    }
}

#Preview {
    SideMenuView(isShowing: .constant(true))
}
