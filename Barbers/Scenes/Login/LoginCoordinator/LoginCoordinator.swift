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
        window.makeKeyAndVisible()
    }
    
    func start() {
        let viewController = LoginViewController()
        presenter.pushViewController(viewController, animated: false)
    }
}
