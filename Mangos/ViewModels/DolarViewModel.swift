//
//  DolarViewModel.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation

class DolarViewModel: ObservableObject {
    
    @Published var dolarDataBlue: DolarModel?
    @Published var isLoading = true
    @Published var error: Error?
    @Published var dolarDataOficial: DolarModel?
    @Published var dolarDataTarjeta: DolarModel?
    
    
    func fetchDataDolarBlue() {
        NetworkManager.shared.getDolar(tipoDolar: .blue) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let data):
                    self.dolarDataBlue = data
                    
                case .failure(let error) :
                    self.error = error
                    print("Error: \(error)")
                }
            }
        }
    }
    
    
    func fetchDataDolarOficial() {
        NetworkManager.shared.getDolar(tipoDolar: .oficial) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let data):
                    self.dolarDataOficial = data
                    
                case .failure(let error) :
                    self.error = error
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func fetchDataDolarTarjeta() {
        NetworkManager.shared.getDolar(tipoDolar: .tarjeta) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let data):
                    self.dolarDataTarjeta = data
                    
                case .failure(let error) :
                    self.error = error
                    print("Error: \(error)")
                }
            }
        }
    }
    
    
    
}
