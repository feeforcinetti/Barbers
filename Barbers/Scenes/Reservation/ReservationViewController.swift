//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import UIKit

protocol ReservationCoordinatorDelegate: AnyObject {
    func showMenu()
    func goToSelectDateAndHourScreen()
}

class ReservationViewController: UIViewController {

    private unowned var screenView: ReservationView { return self.view as! ReservationView }
    private weak var delegate: ReservationCoordinatorDelegate?
    
    init(delegate: ReservationCoordinatorDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ReservationView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        screenView.itemButton.configItemButtonDelegate(delegate: self)
        screenView.setupDelegate(delegate: self)
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
    
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.rightBarButton))
        searchButton.tintColor = .white
        
        let menuButton = UIBarButtonItem(customView: screenView.itemButton.buttonMenu)
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func rightBarButton() {
        
    }
}

extension ReservationViewController: ItemButtonProtocol {
    func didTappedButton() {
        self.delegate?.showMenu()
    }
}

extension ReservationViewController: ReservationViewControllerProtocol {
    func didTapButton() {
        delegate?.goToSelectDateAndHourScreen()
    }
}
