//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import Foundation
import UIKit

protocol ReservationViewControllerProtocol: AnyObject {
    func didTapButton()
    func buttonShavingAction(type: BeatifulService)
}

enum BeatifulService {
    case hairShaving
    case hairWashing
    case hairCare
    case beardTriming
}

class ReservationView: UIView {
    
    //MARK: Variables
    private weak var delegate: ReservationViewControllerProtocol?
    
    //MARK: Views
    lazy var itemButton = ItemButton()
    
    lazy var searchButton = UIBarButtonItem(barButtonSystemItem: .search,
                                            target: self,
                                            action: #selector(rightBarButton))
    
    lazy var menuButton = UIBarButtonItem(customView: itemButton)
    
    lazy var headerStackView: UIStackView = .stackView(backgroundColor: .clear,
                                                       axis: .vertical,
                                                       spacing: 10)
    
    lazy var searchBar: UISearchBar = .searchBar(textFieldColor: .white)
    
    lazy var helloLabel: UILabel = .label(text: "Hello", textColor: .white, fontSize: 25, fontType: .semibold)
    
    lazy var nameLabel: UILabel = .label(text: "John Doe", textColor: .orange, fontSize: 40, fontType: .semibold)
    
    lazy var servicesLabel: UILabel = .label(text: "Services", textColor: .white, fontSize: 20, fontType: .bold)
    
    lazy var dividerView: UIView = .simpleView(color: .white)
    
    lazy var stackView: UIStackView = .stackView(backgroundColor: .none, axis: .vertical, alignment: .center)
    
    lazy var stackViewTop: UIStackView = .stackView(backgroundColor: .none, axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 15)
    
    lazy var stackViewBotton: UIStackView = .stackView(backgroundColor: .none, axis: .horizontal, distribution: .fillEqually, alignment: .fill, spacing: 15)
    
    lazy var buttonShaving: UIButton = .button(image: "navalha",
                                               imageColor: .white,
                                               cornerRadius: 8,
                                               borderColor: .cyan,
                                               fontSize: 15,
                                               weightFont: .medium,
                                               titleColor: .white,
                                               backgroundColor: .white.withAlphaComponent(0.1),
                                               target: self,
                                               action: #selector(buttonsTapped))
    
    lazy var buttonHairWashing: UIButton = .button(image: "secador",
                                                   imageColor: .white,
                                                   cornerRadius: 8,
                                                   borderColor: .cyan,
                                                   fontSize: 15,
                                                   weightFont: .medium,
                                                   titleColor: .white,
                                                   backgroundColor: .white.withAlphaComponent(0.1),
                                                   target: self,
                                                   action: #selector(buttonsTapped))
    
    lazy var buttonHairCare: UIButton = .button(image: "shampoo",
                                                imageColor: .white,
                                                cornerRadius: 8,
                                                borderColor: .cyan,
                                                fontSize: 15,
                                                weightFont: .medium,
                                                titleColor: .white,
                                                backgroundColor: .white.withAlphaComponent(0.1),
                                                target: self,
                                                action: #selector(buttonsTapped))
    
    lazy var buttonBeardTrimming: UIButton = .button(image: "barba",
                                                     imageColor: .white,
                                                     cornerRadius: 8,
                                                     borderColor: .cyan,
                                                     fontSize: 15,
                                                     weightFont: .medium,
                                                     titleColor: .white,
                                                     backgroundColor: .white.withAlphaComponent(0.1),
                                                     target: self,
                                                     action: #selector(buttonsTapped))
    
    lazy var reservationButton: UIButton = .button(title: "Reservation Now",
                                                   cornerRadius: 20,
                                                   borderColor: .cyan,
                                                   fontSize: 18,
                                                   weightFont: .bold,
                                                   titleColor: .black,
                                                   backgroundColor: .white,
                                                   target: self,
                                                   action: #selector(tappedButton))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        configButtons()
        setupSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupDelegate(delegate: ReservationViewControllerProtocol, searchDelegate: UISearchBarDelegate) {
        self.delegate = delegate
        self.searchBar.delegate = searchDelegate
    }
    
    @objc private func tappedButton() {
        delegate?.didTapButton()
    }
    
    @objc private func buttonsTapped(sender: UIButton) {
        guard let service = getServiceType(sender.tag) else { return }
        delegate?.buttonShavingAction(type: service)
    }
    
    func getServiceType(_ tag: Int) -> BeatifulService? {
        switch tag {
        case buttonShaving.tag:
            return .hairShaving
        case buttonHairWashing.tag:
            return .hairWashing
        case buttonHairCare.tag:
            return .hairCare
        case buttonBeardTrimming.tag:
            return .beardTriming
        default:
            return nil
        }
    }
    
    @objc func rightBarButton() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut) {
                self.searchBar.isHidden = !self.searchBar.isHidden
                
                if self.searchBar.isHidden {
                    self.searchBar.endEditing(true)
                }
            }
        }
    }
    
    private func configButtons() {
        buttonShaving.imageView?.contentMode = .scaleAspectFit
        buttonShaving.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buttonShaving.tag = 1
        
        buttonHairWashing.imageView?.contentMode = .scaleAspectFit
        buttonHairWashing.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buttonHairWashing.tag = 2
        
        buttonHairCare.imageView?.contentMode = .scaleAspectFit
        buttonHairCare.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buttonHairCare.tag = 3
        
        buttonBeardTrimming.imageView?.contentMode = .scaleAspectFit
        buttonBeardTrimming.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        buttonBeardTrimming.tag = 4
        
        searchButton.tintColor = .white
    }
    
    private func setupSearchBar() {
        searchBar.isHidden = true
    }
}

extension ReservationView: ViewConfigureProtocol {
    func buildHierarchy() {
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(searchBar)
        headerStackView.addArrangedSubview(helloLabel)
        headerStackView.addArrangedSubview(nameLabel)
        
        addSubview(dividerView)
        addSubview(servicesLabel)
        addSubview(stackView)
        
        stackView.addArrangedSubview(stackViewTop)
        stackViewTop.addArrangedSubview(buttonShaving)
        stackViewTop.addArrangedSubview(buttonHairWashing)
        
        stackView.addArrangedSubview(stackViewBotton)
        stackViewBotton.addArrangedSubview(buttonHairCare)
        stackViewBotton.addArrangedSubview(buttonBeardTrimming)
        
        addSubview(reservationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            dividerView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8),
            dividerView.leadingAnchor.constraint(equalTo: buttonShaving.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: buttonHairWashing.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            servicesLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 40),
            servicesLabel.leadingAnchor.constraint(equalTo: buttonShaving.leadingAnchor),
            servicesLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
            
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            stackViewTop.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            stackViewTop.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            stackViewTop.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
            
            stackViewBotton.leadingAnchor.constraint(equalTo: stackViewTop.leadingAnchor),
            stackViewBotton.trailingAnchor.constraint(equalTo: stackViewTop.trailingAnchor),
            stackViewBotton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20),
            
            buttonShaving.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 20),
            buttonShaving.heightAnchor.constraint(equalToConstant: 125),
            buttonShaving.widthAnchor.constraint(equalToConstant: 125),
            buttonShaving.bottomAnchor.constraint(equalTo: buttonHairCare.topAnchor, constant: -20),
            
            buttonHairCare.heightAnchor.constraint(equalToConstant: 125),
            buttonHairCare.widthAnchor.constraint(equalToConstant: 125),
            buttonHairCare.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -20),
            
            reservationButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reservationButton.heightAnchor.constraint(equalToConstant: 45),
            reservationButton.widthAnchor.constraint(equalToConstant: 280),
            reservationButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}
