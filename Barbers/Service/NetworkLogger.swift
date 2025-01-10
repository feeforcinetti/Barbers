//
//  NetworkLogger.swift
//  Barbers
//
//  Created by Felipe Forcinetti Celestino on 12/06/24.
//

import Foundation

struct NetworkLogger {
    static func log(request: URLRequest?, response: URLResponse?, data: Data?, error: Error?, verbose: Bool = true) {
        print("---------- 🚀 START REQUEST 🚀----------")
        
        if let request = request {
            print("Request URL: \(request.url?.absoluteString ?? "N/A")")
            print("Request Method: \(request.httpMethod ?? "N/A")")
            
            if verbose {
                print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
                
                if let body = request.httpBody {
                    let bodyString = String(data: body, encoding: .utf8) ?? "N/A"
                    print("Request Body: \(bodyString)")
                }
            }
        } else {
            print("Request: N/A")
        }
        
        if let response = response as? HTTPURLResponse {
            let statusIcon = (200...299).contains(response.statusCode) ? "✅" : "❌"
            print("Response Status Code: \(response.statusCode) \(statusIcon)")
        }
        
        if let data = data {
            let dataString = String(data: data, encoding: .utf8) ?? "N/A"
            print("Response Data: \(dataString)")
        } else {
            print("Response Data: N/A")
        }
        
        if let error = error {
            print("🔴 Error: \(error.localizedDescription)")
        } else {
            print("🔴 Error: N/A")
        }
        
        print("---------- END REQUEST ----------")
    }
    
    static func logError(error: NetworkError) {
        print("---------- ❌ START OF ERROR ❌ ----------")
        print("Failed URL: \(error.errorDescription ?? "")")
        print("---------- END OF ERROR ----------\n")
    }
}
