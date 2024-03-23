//
//  CardMontoHome.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct CardMontoHome: View {
    
    @StateObject var vmRegistros = RegistrosViewModel()
    var balance: Int
    @State var ingresos: Int = 0
    @State var egresos: Int = 0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color.accentColor)
            VStack{
                VStack{
                    HStack{
                        Text("Balance total del mes")
                            .foregroundStyle(Color.blackWhite)
                        Spacer()
                    }
                    .padding(.top,20)
                    .padding(.bottom,1)
                    HStack{
                        Text("$ \(balance)")
                            .font(.system(size: AppTheme.fontSizeMontoNumericoGrande))
                            .foregroundStyle(Color.blackWhite)
                            .bold()
                        Spacer()
                    }
                }
                .padding(.leading,30)
                
                Spacer()
                
                HStack{
                    VStack(alignment:.leading){
                        Text("Ingresos")
                            .foregroundStyle(Color.blackWhite)
                            .font(.footnote)
                            .padding(.bottom,2)
                        Text("+ $ \(ingresos)")
                            .foregroundStyle(Color.blackWhite)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    VStack(alignment:.leading){
                        Text("Egresos")
                            .foregroundStyle(Color.blackWhite)
                            .font(.footnote)
                            .padding(.bottom,2)
                        Text("- $ \(egresos)")
                            .foregroundStyle(Color.blackWhite)
                            .fontWeight(.semibold)
                    }
                    .padding(.trailing,30)
                }
                .padding(.horizontal,30)
                .padding(.bottom,20)

            }
            
            
            
        }
        .frame(width: .infinity,height: 180)
        .padding(.horizontal,20)
        .shadow(radius: 5)
        .onAppear {
            
            ingresos = vmRegistros.sumatoriaIngresos()
            egresos = vmRegistros.sumatoriaEgresos()
        }
    }
}

#Preview {
    CardMontoHome(balance: 1200000, ingresos:1200, egresos: 10000)
}
