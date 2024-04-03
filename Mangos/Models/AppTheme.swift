//
//  AppTheme.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import Foundation
import SwiftUI

class AppTheme: ObservableObject {
    
    static let shared = AppTheme()
    
    static let fontSizeMontoNumericoGrande: CGFloat = 40
    static let fontSizeListas: CGFloat = 18
    static let montosTarjeta: CGFloat = 16
    
    
    enum tipo{
        case ingresos
        case gastos
        case ahorros
        case tarjeta
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
 
    
    
}




