//
//  ReservationModel.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/25.
//

import Foundation

struct Reservation: Codable {
    let date: Date
    let serviceType: String
    
    private enum CodingKeys: String, CodingKey {
        case date
        case serviceType = "service_type"
    }
}
