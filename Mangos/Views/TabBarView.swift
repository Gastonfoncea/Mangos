//
//  TabBarView.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import SwiftUI

struct TabBarView: View {
    
    //inicializamos el viewModel con StateObject para pasarlo desde aca
    @State var index = 0
    var body: some View {
        VStack{
            
        }
//        TabView{
//            Home()
//                .tabItem {
//                    Label("Home", systemImage: "house")
//                }
//       
//                
//            
//            Profile()
//                .tabItem {
//                    Label("Perfil", systemImage: "person.fill")
//                }
//        }
    }
}

#Preview {
    TabBarView()
}
