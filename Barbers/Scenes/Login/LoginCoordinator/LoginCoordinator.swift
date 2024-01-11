//
//  LoginCoordinator.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/01/24.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    let window: UIWindow
    var presenter: UINavigationController
    var coordinator: Coordinator?
    
    init(window: UIWindow, presenter: UINavigationController) {
        self.window = window
        self.presenter = presenter
    }
    
    func start() {
        let loginViewControlle = LoginViewController(delegate: self)
        presenter.pushViewController(loginViewControlle, animated: true)
        window.makeKeyAndVisible()
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func goToReservationScreen() {
        let coordinator = ReservationCoordinator(presenter: presenter)
        coordinator.start()
        self.coordinator = coordinator
    }
}
