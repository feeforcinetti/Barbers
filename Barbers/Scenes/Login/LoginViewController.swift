//
//  ViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginScreen: LoginView?
    
    override func loadView() {
        self.loginScreen = LoginView()
        self.view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.configDelegate(delegate: self)
        self.view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }

}
    
extension LoginViewController : LoginViewProtocol {
    func actionLoginButton() {
        let vc : ReservationViewController = ReservationViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}
