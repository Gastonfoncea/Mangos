//
//  GeneralFunctions.swift
//  Mangos
//
//  Created by Gaston Foncea on 12/03/2024.
//

import Foundation


class GeneralFunctions: ObservableObject {
    
    //Conversion de datos
    func StringToDouble(valor:String) -> Double {
        let error = 0.00
        guard let valorInt = Double(valor) else { return error }
        let roundedValue = (valorInt * 100).rounded() / 100
        return roundedValue
    }
    
    
    func StringToInt(valor:String) -> Int {
        guard let valorInt = Int(valor) else {
            return 0
        }
        return valorInt
    }
 
    
    func stringToRoundedString(valor: String) -> String {
        let error = "0.00"
        
        guard let valorDouble = Double(valor) else {
            return error
        }
        
        let roundedValue = (valorDouble * 100).rounded() / 100
        return String(format: "%.2f", roundedValue)
    }
    
    
    func DateString(fecha:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: fecha)
        return dateString
        
    }
    
    //Visual
    func getTodayDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" // Puedes ajustar el formato según tus preferencias
        
        let currentDate = Date()
        return dateFormatter.string(from: currentDate)
    }
    
    
}



