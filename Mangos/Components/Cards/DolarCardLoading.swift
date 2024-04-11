//
//  DolarCardLoading.swift
//  Mangos
//
//  Created by Gaston Foncea on 10/04/2024.
//

import SwiftUI

struct DolarCardLoading: View {
    
    @State var show = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body: some View {
        ZStack{
            Color.accentColorInvertido
                .frame(height: 85)
                .cornerRadius(15)
            
            
            Color.white
                .frame(height: 85)
                .cornerRadius(15)
                .mask(
                    Rectangle()
                        .fill(
                        
                            LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.25),.clear]), startPoint: .top, endPoint: .bottom)
                        )
                        .rotationEffect(.init(degrees: 70))
                        .offset(x: self.show ? center : -center)
                )
                
        }
        .foregroundStyle(.accentColorInvertido)
        .frame(maxWidth: .infinity)
        .frame(height: 85)
        .onAppear{
            withAnimation(Animation.linear.speed(0.25).delay(0)
                .repeatForever(autoreverses: false)){
                    self.show.toggle()
                }
        }

    }
}

#Preview {
    DolarCardLoading()
}
