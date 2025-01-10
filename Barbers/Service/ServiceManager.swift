//
//  ServiceManager.swift
//  Barbers
//
//  Created by Felipe Forcinetti Celestino on 12/06/24.
//

import UIKit

class ServiceManager {
    
    static var shared: ServiceManager = ServiceManager(baseUrl: "https://m7bank.multisete.com/")
    
    private var session: URLSession = URLSession.shared
    private var baseUrl: String
    
    public init(baseUrl: String? = nil) {
        if let baseUrl = baseUrl {
            self.baseUrl = baseUrl
        } else if let baseUrlString = Bundle.main.infoDictionary?["BaseURL"] as? String {
            self.baseUrl = baseUrlString
        } else {
            self.baseUrl = ""
        }
    }
    
}

extension ServiceManager: NetworkProtocol {
    
     func createRequest<T:Codable>(with urlComponents: UrlComponents, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        let urlString: String = baseUrl + urlComponents.endpoint
        
        guard let url: URL = URL(string: urlString) else {
            NetworkLogger.logError(error: .invalidURL(url: urlString))
            completion(.failure(.invalidURL(url: urlString)))
            return
        }
        
        var request = URLRequest(url: url)
        
        if let parameters = urlComponents.parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                completion(.failure(.decodingError(error)))
                return
            }
        }
        
        request.httpMethod = urlComponents.methods.rawValue
        request.allHTTPHeaderFields = urlComponents.headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                NetworkLogger.log(request: request, response: response, data: data, error: error)
                if let error {
                    completion(.failure(.networkFailure(error)))
                }
                
                guard let data else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let object: T = try decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch  {
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
        task.resume()
        
    }
}
