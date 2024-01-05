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
        print("delegate disparado!")
        let coordinator = ReservationCoordinator(presenter: presenter)
        coordinator.start()
    }
}
