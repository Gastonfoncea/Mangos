//
//  DolarModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation


struct DolarModel: Codable,Hashable {

    var compra: Decimal
    var venta: Decimal
    var casa: String
    var nombre: String
    var moneda: String
    var fechaActualizacion: String

}
