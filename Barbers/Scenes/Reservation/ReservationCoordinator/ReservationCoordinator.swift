//
//  ReservationCoordinator.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/01/24.
//

import UIKit

class ReservationCoordinator: Coordinator {
    var presenter: UINavigationController
    var reservationViewController: ReservationViewController!
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        reservationViewController = ReservationViewController(delegate: self)
        presenter.pushViewController(reservationViewController, animated: true)
    }
}

extension ReservationCoordinator: ReservationCoordinatorDelegate {
    
    func showMenu() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemGray
        presenter.present(viewController, animated: true)
    }
    
    func goToSelectDateAndHourScreen() {
        let viewController = SchedulingViewController()
        presenter.pushViewController(viewController, animated: true)
    }
    
    func showAlertController(title: String,
                             message: String,
                             hasTwoButtons: Bool,
                             okButtonTitle: String,
                             cancelButtonTitle: String? = nil,
                             okAction: @escaping (() -> Void),
                             cancelAction: (() -> Void)?
    ) {
        presenter.showAlert(title: title,
                            message: message,
                            preferredStyle: .alert,
                            hasTwoButtons: hasTwoButtons,
                            okButtonTitle: okButtonTitle,
                            okAction: { okAction() },
                            cancelButtonTitle: cancelButtonTitle,
                            cancelAction: { cancelAction?() })
    }
}
