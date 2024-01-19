//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import UIKit
import Foundation

protocol ReservationCoordinatorDelegate: AnyObject {
    func showMenu()
    func goToSelectDateAndHourScreen()
    func showAlertController(title: String,
                             message: String,
                             hasTwoButtons: Bool,
                             okButtonTitle: String,
                             cancelButtonTitle: String?,
                             okAction: @escaping (() -> Void),
                             cancelAction: (() -> Void)?)
}

class ReservationViewController: UIViewController {

    unowned var screenView: ReservationView { return self.view as! ReservationView }
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
        screenView.setupDelegate(delegate: self, searchDelegate: self)
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.hidesBackButton = true
        
        navigationItem.leftBarButtonItem = screenView.menuButton
        navigationItem.rightBarButtonItem = screenView.searchButton
    }
}

extension ReservationViewController: ItemButtonProtocol {
    func didTappedButton() {
        self.delegate?.showMenu()
    }
}

extension ReservationViewController: ReservationViewControllerProtocol {
    func buttonShavingAction(type: BeatifulService) {
        
        switch type {
        case .hairShaving:
            delegate?.showAlertController(title: "Hair Shaving".uppercased(),
                                          message: "BTN 1",
                                          hasTwoButtons: false,
                                          okButtonTitle: "Trocar para azul",
                                          cancelButtonTitle: nil,
                                          okAction: { self.screenView.backgroundColor = .blue },
                                          cancelAction: nil)
        case .hairWashing:
            delegate?.showAlertController(title: "Hair Washing".uppercased(),
                                          message: "BTN 2",
                                          hasTwoButtons: false,
                                          okButtonTitle: "Trocar para amarelo",
                                          cancelButtonTitle: nil,
                                          okAction: { self.screenView.backgroundColor = .yellow },
                                          cancelAction: nil)
        case .hairCare:
            delegate?.showAlertController(title: "Hair Care".uppercased(),
                                          message: "BTN 3",
                                          hasTwoButtons: true,
                                          okButtonTitle: "Trocar para laranja",
                                          cancelButtonTitle: "Voltar para preto",
                                          okAction: { self.screenView.backgroundColor = .orange },
                                          cancelAction: { self.screenView.backgroundColor = .black })
        case .beardTriming:
            delegate?.showAlertController(title: "Beard Triming".uppercased(),
                                          message: "BTN 4",
                                          hasTwoButtons: true,
                                          okButtonTitle: "Trocar para cyan",
                                          cancelButtonTitle: "Voltar para preto",
                                          okAction: { self.screenView.backgroundColor = .cyan },
                                          cancelAction: { self.screenView.backgroundColor = .black })
        }
    }
    
    func didTapButton() {
        delegate?.goToSelectDateAndHourScreen()
    }
}

extension ReservationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
