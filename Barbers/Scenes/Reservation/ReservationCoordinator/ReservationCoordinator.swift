//
//  ReservationCoordinator.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/01/24.
//

import UIKit

class ReservationCoordinator: Coordinator {
    var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let viewController = ReservationViewController()
        presenter.pushViewController(viewController, animated: true)
    }
    
}
