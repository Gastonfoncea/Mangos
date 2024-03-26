//
//  AppTheme.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import Foundation
import SwiftUI

class AppTheme: ObservableObject {
    
    static let fontSizeMontoNumericoGrande: CGFloat = 32
    static let fontSizeListas: CGFloat = 18
    static let montosTarjeta: CGFloat = 18
    
    
    enum tipo{
        case ingresos
        case gastos
        case ahorros
        case tarjeta
    }
    
    func Icono(_ tipo:tipo) -> String {
        switch tipo{
        case.ingresos:
            return "dock.arrow.down.rectangle"
        case .gastos:
            return "takeoutbag.and.cup.and.straw.fill"
        case .ahorros:
            return "handbag.fill"
        case .tarjeta:
            return "creditcard.fill"
        }
    }
    
    func IconoString(tipo: String) -> String {
        switch tipo {
        case "Ingresos":
            return "dock.arrow.down.rectangle"
        case "Gastos":
            return "takeoutbag.and.cup.and.straw.fill"
        case "Ahorros":
            return "handbag.fill"
        case "Tarjetas":
            return "creditcard.fill"
        default:
            return "house"
        }
    }
    
    func tipo(_ tipo:tipo) -> String{
        switch tipo {
        case .ingresos:
            return "Ingresos"
        case .gastos:
            return "Gastos"
        case .ahorros:
            return "Ahorros"
        case .tarjeta:
            return "Tarjetas"
        }
    }
    
    func color(_ tipo:tipo) -> Color {
        switch tipo {
        case .ingresos:
            return .greenColorG
        case .gastos:
            return .orangeColorG
        case .ahorros:
            return .violetColorG
        case .tarjeta:
            return .blueColorG
        }
    }
    
    func colorString(tipo:String) -> Color {
        switch tipo {
        case "Ingresos":
            return .greenColorG
        case "Gastos":
            return .orangeColorG
        case "Ahorros":
            return .violetColorG
        case "Tarjetas":
            return .blueColorG
        default:
            return .blueColorG
        }
    }
    
    func ColorMontoTarjeta(tipo: String) -> Color {
        switch tipo {
        case "Ingresos":
            return .greenG
        case "Gastos":
            return .redG
        case "Ahorros":
            return .greenG
        case "Tarjetas":
            return .redG
        default:
            return .blueColorG
        }
    }
    
    
}




