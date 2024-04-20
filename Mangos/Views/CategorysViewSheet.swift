//
//  CategorysViewSheet.swift
//  Mangos
//
//  Created by Gaston Foncea on 03/04/2024.
//

import SwiftUI

//Vista donde mostramos las categorias para seleccionar en la grilla al momento de crear un nuevo Registro

struct CategorysViewSheet: View {
    
    @Binding var isShowingCategories: Bool
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
                       isShowingCategories = false
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
