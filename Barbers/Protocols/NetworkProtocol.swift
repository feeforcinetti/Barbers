//
//  NetworkProtocol.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/25.
//

import Foundation

protocol NetworkProtocol {
    func createRequest<T:Codable>(with urlComponents: UrlComponents, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
