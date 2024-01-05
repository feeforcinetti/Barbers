//
//  ViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func goToReservationScreen()
}

class LoginViewController: UIViewController {
    
    //MARK: Variables
    private unowned var loginScreen: LoginView { return self.view as! LoginView }
    private weak var delegate: LoginCoordinatorDelegate?
    
    //MARK: Init
    init(delegate: LoginCoordinatorDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle
    override func loadView() {
        self.view = LoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen.configDelegate(delegate: self)
        self.view.backgroundColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
    
extension LoginViewController : LoginViewProtocol {
    
    func actionLoginButton() {
        self.delegate?.goToReservationScreen()
    }
    
}
