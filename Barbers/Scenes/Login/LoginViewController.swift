//
//  ViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView = {
        let loginView = LoginView()
        
        return loginView
    }()
    
    init(loginView: LoginView) {
        self.loginView = loginView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = loginView
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

extension LoginViewController: LoginViewControllerProtocol {
    func didTapButton() {
        let rootVc =  ReservationViewController()
        let navVc = UINavigationController(rootViewController: rootVc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
    }
    
    
}
