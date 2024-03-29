//
//  DolarModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation


struct DolarModel: Codable,Hashable {

    var compra: Int
    var venta: Int
    var casa: String
    var nombre: String
    var moneda: String
    var fechaActualizacion: String

}
