//
//  ReservationRepository.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/25.
//

import Foundation

protocol ReservationRepositoryProtocol {
    func createReserve()
}

class ReservationRepository: ReservationRepositoryProtocol {
    func createReserve() {
        let urlComponents = UrlComponents(endpoint: "",
                                          methods: .post)
        ServiceManager.shared.createRequest(
            with: urlComponents,
            decodeType: Reservation.self,
            completion: { result in
                switch result {
                case .success:
                    break
                case .failure:
                    break
                }
            })
    }
}
