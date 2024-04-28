//
//  ViewFlowData.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/04/2024.
//

import Foundation
import SwiftUI

/*
Aca manejaremos la logica de la navegacion, incluyendo el paso de datos de una view a otra, creamos un static let para poder llamar a ese objeto desde cualquier lugar de la app sin instanciarlo
 Vamos a hacer una funcion por cada vista a la que queremos navegar, llamando a la clase donde esta el enum y seleccionando la vista
 */


class ViewFlowData: ObservableObject {
    
    static let shared = ViewFlowData()
    
    @Published var path = NavigationPath()
    @Published var tipo: String = ""
    @Published var monto: String = ""
    
    func clear() {
        path = .init()
    }
    
    
    func navigateBackToRoot() {
        path.removeLast(path.count)
    }
    
    
    func backToPrevious() {
        path.removeLast()
    }
    
    
    func done() {
        path = .init()
    }
    
    ///FUNCIONES PARA NAVEGAR A LAS VISTAS MEDIANTE NAVEGACION CUSTOM

    //navegacion a listado de Registros
    func navigateToListOgReg() {
        path.append(ViewsNavigation.listOfRegistros)
    }
    
    //navegacion a newRegistroP1
    func navigateToNewRegP1() {
        path.append(ViewsNavigation.newRegistroP1)
    }
    
    //navegacion a newRegistroP2
    func navigateToNewRegP2() {
        path.append(ViewsNavigation.newRegistroP2)
    }
    
    
}
