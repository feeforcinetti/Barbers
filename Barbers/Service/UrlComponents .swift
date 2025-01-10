//
//  UrlComponents .swift
//  Barbers
//
//  Created by Felipe Forcinetti Celestino on 12/06/24.
//

import Foundation

public typealias Parameters = [String: Any]

struct UrlComponents {
    let endpoint: String
    let headers: [String : String]? = nil
    let parameters: Parameters? = [String: Any]()
    let methods: HTTPMethods
}
