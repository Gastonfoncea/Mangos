//
//  DolarViewModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation

class DolarViewModel: ObservableObject {
    
    @Published var dolarDataBlue: DolarModel?
    @Published var dolarDataOficial: DolarModel?
    @Published var dolarDataTarjeta: DolarModel?
    
    
    func fetchDataDolarBlue() {
        NetworkManager.shared.getDolar(tipoDolar: .blue) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dolarDataBlue = data
                }
            case .failure(let error) :
                print("Error: \(error)")
            }
        }
    }
    
    
    func fetchDataDolarOficial() {
        NetworkManager.shared.getDolar(tipoDolar: .oficial) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dolarDataOficial = data
                }
            case .failure(let error) :
                print("Error: \(error)")
            }
        }
    }
    
    func fetchDataDolarTarjeta() {
        NetworkManager.shared.getDolar(tipoDolar: .tarjeta) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.dolarDataTarjeta = data
                }
            case .failure(let error) :
                print("Error: \(error)")
            }
        }
    }
    
    
    
}
