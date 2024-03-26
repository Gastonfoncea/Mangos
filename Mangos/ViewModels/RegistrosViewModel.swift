//
//  RegistrosViewModel.swift
//  Guita
//
//  Created by Gaston Foncea on 09/03/2024.
//

import Foundation
import SwiftData
import SwiftUI

class RegistrosViewModel: ObservableObject {
    
    @Published var registros: [RegistrosModel] = []
    @Published var monto: Int = 0
    @Published var balanceTotal = 0
    @Published var sumaIngresos = 0
    @Published var soloIngresos = 0
    @Published var sumaEgresos = 0
    @Published var sumaGastos = 0
    @Published var sumaAhorros = 0
    @Published var sumaTarjetas = 0
    @Published var dimiss: Bool = false
    
    
    var picker: [String] = ["Ingreso","Gastos","Ahorros","Tarjetas"]
    
    
    // PICKER SECTION - ENUMS Y SWITCH
    var ingresosPicker: [String] = ["Sueldo 💵","Negocios 💻","Otros❔"]
    var gastosPicker: [String] = ["Comida,", "Gastos", "Otros"]
    var ahorrosPicker: [String] = ["Sueldo", "Regalos", "Otros"]
    var tarjetasPicker: [String] = ["Debito","Credito"]
    
    
    
    
    enum tipo {
        case Ingresos
        case Gastos
        case Ahorros
        case Tarjetas
    }
    
    
    //MARK: SWIFTDATA
    
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    init() {
        self.modelContainer = try! ModelContainer(for: RegistrosModel.self)
        self.modelContext = modelContainer.mainContext
    }
    
    
    
    //MARK: CRUD - Create - Read - Update - Delete
    
    func saveRegistro(tipo: String, monto: String, detalle: String, fecha: Date) {
        let registroSwiftData = RegistrosModel(tipo: tipo, monto: monto, detalle: detalle, fecha: fecha)
        modelContext.insert(registroSwiftData)
        print("El registro se guardo correctamente")
    }
    
    
    func fetchRegistrosTotal() -> [RegistrosModel] {
        let registrosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ingresos" || $0.tipo == "Gastos" || $0.tipo == "Ahorros" || $0.tipo == "Tarjetas" }
        let ingresosDescriptor = FetchDescriptor<RegistrosModel>(predicate:registrosPredicate, sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
        do{
            let registros = try modelContext.fetch(ingresosDescriptor)
            return registros
        } catch {
            print("El array esta vacio")
            return []
        }
    }
        
    
    func fetchRegistrosPorTipo(tipo: tipo) -> [RegistrosModel] {
        switch tipo{
            
        case .Ingresos:
            let ingresosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ingresos"}
            let ingresosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ingresosPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let ingresos = try modelContext.fetch(ingresosDescriptor)
                return ingresos
            } catch {
                print("El array esta vacio")
                return []
            }
            
        case.Gastos:
            let gastosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Gastos"}
            let gastosDescriptor = FetchDescriptor<RegistrosModel>(predicate: gastosPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let gastos = try modelContext.fetch(gastosDescriptor)
                return gastos
            } catch {
                print("El array esta vacio")
                return []
            }
            
        case .Ahorros:
            let ahorrosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ahorros"}
            let ahorrosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ahorrosPredicate,sortBy: 
                [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let ahorros = try modelContext.fetch(ahorrosDescriptor)
                return ahorros
            } catch {
                print("El array esta vacio")
                return []
            }
            
        case .Tarjetas:
            let tarjetasPredicate = #Predicate<RegistrosModel> {$0.tipo == "Tarjetas"}
            let tarjetasDescriptor = FetchDescriptor<RegistrosModel>(predicate: tarjetasPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let tarjetas =  try modelContext.fetch(tarjetasDescriptor)
                return tarjetas
            } catch {
                print("El array esta vacio")
                return []
            }
        }
    }
    
    
    func deleteRegistro(tipo:tipo, index:Int) {
        switch tipo {
        case .Ingresos:
            let ingresosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ingresos"}
            let ingresosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ingresosPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let ingresos = try modelContext.fetch(ingresosDescriptor)
                modelContext.delete(ingresos[index])
            } catch {
                print("No pudimos eliminar el registro")
            }
            
        case .Gastos:
            let gastosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Gastos"}
            let gastosDescriptor = FetchDescriptor<RegistrosModel>(predicate: gastosPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let gastos = try modelContext.fetch(gastosDescriptor)
                modelContext.delete(gastos[index])
            } catch {
                print("No pudimos eliminar el registro")
                
            }
            
        case .Ahorros:
            let ahorrosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ahorros"}
            let ahorrosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ahorrosPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let ahorros = try modelContext.fetch(ahorrosDescriptor)
                modelContext.delete(ahorros[index])
            } catch {
                print("No pudimos eliminar el registro")
            }
            
        case .Tarjetas:
            let tarjetasPredicate = #Predicate<RegistrosModel> {$0.tipo == "Tarjetas"}
            let tarjetasDescriptor = FetchDescriptor<RegistrosModel>(predicate: tarjetasPredicate,sortBy: [SortDescriptor(\RegistrosModel.fecha,order: .reverse)])
            do {
                let tarjetas = try modelContext.fetch(tarjetasDescriptor)
                modelContext.delete(tarjetas[index])
            } catch {
                print("No pudimos eliminar el registro")
            }
        }
    }
    
    //MARK: Sumatoria de registros y calculos
    
    func balance() {
        
        var ingresos: [RegistrosModel] = []
        var gastos: [RegistrosModel] = []
        var ahorros: [RegistrosModel] = []
        var tarjetas: [RegistrosModel] = []
        
        
        let ingresosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ingresos"}
        let ingresosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ingresosPredicate)
        do {
            ingresos = try modelContext.fetch(ingresosDescriptor)
        } catch {
            print("El array esta vacio")
        }
        
        let gastosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Gastos"}
        let gastosDescriptor = FetchDescriptor<RegistrosModel>(predicate: gastosPredicate)
        do {
            gastos = try modelContext.fetch(gastosDescriptor)
            
        } catch {
            print("El array esta vacio")
        }
        
        let ahorrosPredicate = #Predicate<RegistrosModel> {$0.tipo == "Ahorros"}
        let ahorrosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ahorrosPredicate)
        do {
            ahorros = try modelContext.fetch(ahorrosDescriptor)
            
        } catch {
            print("El array esta vacio")
        }
        
        let tarjetasPredicate = #Predicate<RegistrosModel> {$0.tipo == "Tarjetas"}
        let tarjetasDescriptor = FetchDescriptor<RegistrosModel>(predicate: tarjetasPredicate)
        do {
            tarjetas =  try modelContext.fetch(tarjetasDescriptor)
            
        } catch {
            print("El array esta vacio")
        }
        /// sumatoria de los gastos y los ingresos para poderlos restar
        let ingresosCalculo = ingresos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        let gastosCalculo = gastos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        let ahorrosCalculo = ahorros.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        let tarjetasCalculo = tarjetas.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
        
        balanceTotal = ingresosCalculo + ahorrosCalculo - gastosCalculo - tarjetasCalculo
    }
    
    
    
    func sumarRegistrosPorTipo(tipo:tipo) -> Int {
        switch tipo {
        case .Ingresos:
            let ingresosPredicate = #Predicate<RegistrosModel> {  $0.tipo == "Ingresos" }
            let ingresosDescriptor = FetchDescriptor<RegistrosModel>(predicate: ingresosPredicate)
            do {
                let ingresos = try modelContext.fetch(ingresosDescriptor)
                let ingresosCalculo = ingresos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
                sumaIngresos = ingresosCalculo
                return ingresosCalculo
            } catch {
                print("No se pudo realizar la operacion")
                return 0
            }
            
        case .Gastos:
            let gastosPredicate = #Predicate<RegistrosModel> { $0.tipo == "Gastos" }
            let gastosDescriptor = FetchDescriptor<RegistrosModel> (predicate: gastosPredicate)
            do{
                let gastos = try modelContext.fetch(gastosDescriptor)
                let gastosCalculo = gastos.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
                sumaGastos = gastosCalculo
                return gastosCalculo
            } catch {
                print("No se pudo realizar la operacion")
                return 0
            }
           
        case .Ahorros:
            let ahorrosPredicate = #Predicate<RegistrosModel> { $0.tipo == "Ahorros" }
            let ahorrosDescriptor = FetchDescriptor<RegistrosModel> (predicate: ahorrosPredicate)
            do{
                let ahorros = try modelContext.fetch(ahorrosDescriptor)
                let ahorrosCalculo = ahorros.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
                sumaAhorros = ahorrosCalculo
                return ahorrosCalculo
            } catch {
                print("No se pudo realizar la operacion")
                return 0
            }
            
        case .Tarjetas:
            let tarjetasPredicate = #Predicate<RegistrosModel> { $0.tipo == "Tarjetas" }
            let tarjetasDescriptor = FetchDescriptor<RegistrosModel> (predicate: tarjetasPredicate)
            do {
                let tarjetas = try modelContext.fetch(tarjetasDescriptor)
                let tarjetasCalculo = tarjetas.reduce(0) { $0 + (Int($1.monto) ?? 0 )}
                sumaTarjetas = tarjetasCalculo
                return tarjetasCalculo
            } catch {
                print("No se pudo realizar la operacion")
                return 0
            }
        }
    }
    
    func sumatoriaIngresos() -> Int {
        let ingresos = sumarRegistrosPorTipo(tipo: .Ingresos)
        let ahorros = sumarRegistrosPorTipo(tipo: .Ahorros)
        let suma = ingresos + ahorros
        return suma
    }
    
    func sumatoriaEgresos() -> Int {
        let gastos = sumarRegistrosPorTipo(tipo: .Gastos)
        let tarjetas = sumarRegistrosPorTipo(tipo: .Tarjetas)
        let suma = gastos + tarjetas
        return suma
    }
    
    
    
}




    

