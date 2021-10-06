//
//  ViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginView: LoginView?
    
    override func loadView() {
        self.loginView = LoginView()
        self.view = self.loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

}

