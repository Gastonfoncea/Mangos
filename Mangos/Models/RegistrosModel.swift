//
//  RegistrosModel.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import Foundation
import SwiftData

@Model
class RegistrosModel{
    
    var tipo: String
    var monto: String
    var detalle: String
    var fecha: Date
    
    init(tipo: String, monto: String, detalle: String, fecha: Date) {
        self.tipo = tipo
        self.monto = monto
        self.detalle = detalle
        self.fecha = fecha
    }
    
}
