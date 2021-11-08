//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import UIKit

class ReservationViewController: UIViewController {

    private var reservationView: ReservationView?
    private var itemButton = ItemButton()
    
    
    override func loadView() {
        self.reservationView = ReservationView()
        self.view = reservationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.itemButton.configDelegateItemButton(delegate: self)
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
    
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(self.rightBarButton))
        searchButton.tintColor = .white
        
        let menuButton = UIBarButtonItem(customView: itemButton.buttonMenu)
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.rightBarButtonItem = searchButton
        
    }
    
    @objc func rightBarButton() {
        
    }
 
}

extension ReservationViewController: ItemButtonProtocol {
    func didTappedButton() {
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: false)
        
        
    }
    
    
}
