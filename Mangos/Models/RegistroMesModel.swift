//
//  RegistroMesModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 29/04/2024.
//

import Foundation
import SwiftData

@Model

class RegistroMesModel {
    
    var mes: String
    var balance: String
    var ingresosT: String
    var gastosT: String
    
    init(mes: String, balance: String, ingresosT: String, gastosT: String) {
        self.mes = mes
        self.balance = balance
        self.ingresosT = ingresosT
        self.gastosT = gastosT
    }
}
