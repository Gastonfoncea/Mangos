//
//  CategorysViewSheet.swift
//  Mangos
//
//  Created by Gaston Foncea on 03/04/2024.
//

import SwiftUI

struct CategorysViewSheet: View {
    
    
    @ObservedObject var vmCategory: CategoryModel
    var categorias: [String]
    @Binding var selectedCategory: String?
    let columns: [GridItem] = [
        GridItem(.fixed(100),spacing: 20, alignment: nil),
        GridItem(.fixed(100),spacing: 20, alignment: nil),
        GridItem(.fixed(100),spacing: 20, alignment: nil)
    ]
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Categorias mas Frecuentes")
                    .font(.title3)
                Spacer()
            }
            Divider()
            
            
            LazyVGrid(columns: columns) {
                ForEach(categorias, id: \.self) {index in
                    Button {
                        selectedCategory = index
                    } label: {
                        LogoYNombrePorTipo(tipo: index)
                      
                    }

                }
            }
            .padding(.top,30)
            Spacer()
        }
        .padding(.horizontal,20)
        .padding(.top,40)
    }
}

//#Preview {
//    CategorysViewSheet(vmCategory: CategoryModel(), categorias: ["Sueldo","Comida","Gimnasio","Cuidado Personal", "Estudios", "Ropa", "Salidas", "Restaurants", "FastFood"])
//}
