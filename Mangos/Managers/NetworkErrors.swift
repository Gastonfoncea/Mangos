//
//  NetworkErrors.swift
//  Mangos
//
//  Created by Gaston Foncea on 28/03/2024.
//

import Foundation

enum NetworkErrors: String, Error {
    case unableTipoDolar = "Imposible de completar, coloco mal el tipo de dolar"
    case unableToComplete = "Unable to complete your request. please check your internet conection"
    case invalidResponse = "Invalid response from the server, please try again"
    case invalidData = "the data receive from the server is invalid"
}
