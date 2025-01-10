//
//  NetworkError.swift
//  Barbers
//
//  Created by Felipe Forcinetti Celestino on 12/06/24.
//

import Foundation

enum NetworkError: Error {
    case networkFailure(Error)
    case noData
    case decodingError(Error)
    case invalidResponse
    case invalidURL(url: String)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .networkFailure(let error):
            return "Falha na rede: \(error.localizedDescription)"
        case .noData:
            return "Dados não recebidos da API"
        case .decodingError(let error):
            return "Falha na decodificação: \(error.localizedDescription)"
        case .invalidResponse:
            return "Reponse inválida"
        case .invalidURL(let url):
            return "URL inválida -> \(url)"
        }
    }
}
