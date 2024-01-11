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
        let viewController = ReservationViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
}

extension ReservationCoordinator: ReservationCoordinatorDelegate {
    
    func showMenu() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemGray
        presenter.present(viewController, animated: true)
    }
    
    func goToSelectDateAndHourScreen() {
        let viewController = SelectDateAndHourViewController()
        presenter.pushViewController(viewController, animated: true)
    }
}
