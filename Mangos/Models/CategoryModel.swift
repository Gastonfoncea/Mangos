//
//  CategoryModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 03/04/2024.
//

import Foundation


class CategoryModel: ObservableObject {
    
    @Published var mostFrequent: [String] = ["Sueldo","Comida","Gimnasio","Cuidado Personal", "Estudios", "Ropa", "Salidas", "Restaurants", "FastFood"]
    
}
