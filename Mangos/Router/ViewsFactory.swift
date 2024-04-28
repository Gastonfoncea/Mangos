//
//  ViewsFactory.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/04/2024.
//

import Foundation
import SwiftUI


//Esta clase acepta los destinos creados en el enum y setea las vistas a donde navegara la app realmente.
class ViewsFactory {
    
    static func setViewForDestination(_ destination: ViewsNavigation) -> AnyView {
        
        switch destination {
            
        case .listOfRegistros:
            return AnyView(ListOfRegistros())
            
        case .newRegistroP1:
            return AnyView(NewRegistroP1())
            
        case .newRegistroP2:
            return AnyView(NewRegPart2())
            
        }
    }
}
