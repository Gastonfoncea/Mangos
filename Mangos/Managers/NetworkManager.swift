//
//  NetworkManager.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let baseUrl = "https://dolarapi.com/v1/dolares/"
    
    private init() {}
    
    //buscamos el dolar y en el viewModel le especificamos que tipo de dolar queremos que nos haga el fetch
    func getDolar(tipoDolar:DolarEnum, completed:@escaping(Result<DolarModel,NetworkErrors>)-> Void ) {
        
        let endPoint = baseUrl + "\(tipoDolar)"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.unableTipoDolar))
            return
        }
        
        //url Session nos maneja los 3 parametros
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
                ///verifiacion del endpoint
            if let _ = error {
                completed(.failure(.invalidResponse))
                return // sale de la funcion
            }
            
            ///verificacion de response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            ///verificacion de data
            guard let data1 = data else {
                completed(.failure(.invalidData))
                return
            }
            
            ///decode data con JsonDecoder
            /// if let data = data {
            if let data1 = data {
                let json = try? JSONSerialization.jsonObject(with: data1)
                print(String(describing: json))
                
            }
                do {

                    let decoder = JSONDecoder()
                    let dolares =  try decoder.decode(DolarModel.self, from: data1)
                    completed(.success(dolares))
                    
                } catch {
                    
                    print("Error al decodificar los datos JSON: \(error)")
                    
                }
        }
        task.resume()
    }
    
    
    
}
