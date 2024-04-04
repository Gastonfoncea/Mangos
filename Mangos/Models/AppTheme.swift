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
        case sueldo
        case comida
        case gimnasio
        case cuidadoP
        case estudios
        case ropa
        case salidas
        case restaurants
        case fastfood
        
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
        case "Sueldo":
            return "dock.arrow.down.rectangle"
        case "Comida":
            return "takeoutbag.and.cup.and.straw.fill"
        case "Gimnasio":
            return "dumbbell.fill"
        case "Cuidado Personal":
            return "hand.thumbsup.fill"
        case "Estudios":
            return "text.book.closed.fill"
        case "Ropa":
            return "hanger"
        case "Salidas":
            return "popcorn.fill"
        case "Restaurants":
            return "fork.knife"
        case "FastFood":
            return "takeoutbag.and.cup.and.straw.fill"
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
        case "Sueldo":
            return .colorSueldo
        case "Comida":
            return .colorComida
        case "Gimnasio":
            return .colorGimnasio
        case "Cuidado Personal":
            return .colorCuidadoP
        case "Estudios":
            return .colorEstudios
        case "Ropa":
            return .colorRopa
        case "Salidas":
            return .colorSalidas
        case "Restaurants":
            return .colorRestaurants
        case "FastFood":
            return .colorFastFood
        default:
            return .blueColorG
        }
        
    }
 
    
    
}




