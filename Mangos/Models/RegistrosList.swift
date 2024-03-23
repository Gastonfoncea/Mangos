//
//  RegistrosList.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import Foundation
import SwiftUI

struct RegistrosList {
    
    var name: String
    var icon: String
    var color: Color

    static func listarRegistros() -> [RegistrosList] {
        [RegistrosList(name: "Ingresos", icon: "square.and.arrow.down.fill", color: Color.greenColorG),
         RegistrosList(name: "Gastos", icon: "takeoutbag.and.cup.and.straw.fill", color: Color.orangeColorG),
         RegistrosList(name: "Ahorros", icon: "handbag.fill", color: Color.violetColorG),
         RegistrosList(name: "Tarjetas", icon: "creditcard.fill", color: Color.blueColorG)
        ]
    }
    
}
