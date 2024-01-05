//
//  MainCoordinator.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/01/24.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    let window: UIWindow
    var presenter: UINavigationController
    
    init(window: UIWindow, presenter: UINavigationController) {
        self.window = window
        self.presenter = presenter
        self.window.rootViewController = presenter
    }
    
    func start() {
        let loginCoordinator = LoginCoordinator(window: window, presenter: presenter)
        loginCoordinator.start()
    }
}
