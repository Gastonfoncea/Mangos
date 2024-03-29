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
    
    
    ///Formate Day and Hour
    func formatedDate(date:String) -> String {
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            return formatter
        }()
        
        guard let date = dateFormatter.date(from: date) else {
            return "fecha invalida"
        }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .day], from: date)
        
        if let hour = components.hour, let minute = components.minute, let day = components.day {
            return "\(hour > 12 ? hour - 12 : hour):\(minute) \(hour < 12 ? "AM" : "PM") del día \(day)"
            
        } else {
            return "Fecha inválida"
        }
    }
    
    
}



