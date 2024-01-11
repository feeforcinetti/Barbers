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
}

class ReservationView: UIView, ViewConfigureProtocol {
    
    weak var delegate: ReservationViewControllerProtocol?
    
//    lazy var viewButton: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "menu")
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
    lazy var itemButton = ItemButton()
    
    lazy var HelloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello,"
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "John Doe"
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .orange
        return label
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var servicesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Services"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
   
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .none
        stackView.alignment = .center
        stackView.axis = .vertical
    
        return stackView
    }()
    
    lazy var stackViewTop: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .none
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    lazy var stackViewBotton: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .none
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.alignment = .fill
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    lazy var buttonShaving: UIButton = {
       let buttonShaving = UIButton()
        buttonShaving.translatesAutoresizingMaskIntoConstraints = false
        buttonShaving.backgroundColor = .white.withAlphaComponent(0.1)
        buttonShaving.clipsToBounds = true
        buttonShaving.layer.cornerRadius = 5.0
        buttonShaving.setTitle("shaving", for: .normal)
        buttonShaving.setTitleColor(.white, for: .normal)
        buttonShaving.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buttonShaving.contentVerticalAlignment = .bottom
        buttonShaving.setImage(UIImage(named: "navalha"), for: .normal)
        buttonShaving.imageView?.tintColor = .white
        buttonShaving.imageView?.contentMode = .scaleAspectFit
      
        return buttonShaving
    }()
    
    lazy var buttonHairWashing: UIButton = {
       let buttonHairWashing = UIButton()
        buttonHairWashing.translatesAutoresizingMaskIntoConstraints = false
        buttonHairWashing.backgroundColor = .white.withAlphaComponent(0.1)
        buttonHairWashing.clipsToBounds = true
        buttonHairWashing.layer.cornerRadius = 5.0
        buttonHairWashing.setImage(UIImage(named: "secador"), for: .normal)
        buttonHairWashing.imageView?.tintColor = .white
        buttonHairWashing.imageView?.contentMode = .scaleAspectFit
        return buttonHairWashing
    }()
    
    lazy var buttonHairCare: UIButton = {
       let buttonHairCare = UIButton()
        buttonHairCare.translatesAutoresizingMaskIntoConstraints = false
        buttonHairCare.backgroundColor = .white.withAlphaComponent(0.1)
        buttonHairCare.clipsToBounds = true
        buttonHairCare.layer.cornerRadius = 5.0
        buttonHairCare.setImage(UIImage(named: "shampoo"), for: .normal)
        buttonHairCare.imageView?.tintColor = .white
        buttonHairCare.imageView?.contentMode = .scaleAspectFit
        return buttonHairCare
    }()
    
    lazy var buttonBeardTrimming: UIButton = {
       let buttonBearTrimming = UIButton()
        buttonBearTrimming.translatesAutoresizingMaskIntoConstraints = false
        buttonBearTrimming.backgroundColor = .white.withAlphaComponent(0.1)
        buttonBearTrimming.clipsToBounds = true
        buttonBearTrimming.layer.cornerRadius = 5.0
        buttonBearTrimming.setImage(UIImage(named: "barba"), for: .normal)
        buttonBearTrimming.imageView?.tintColor = .white
        buttonBearTrimming.imageView?.contentMode = .scaleAspectFit
        return buttonBearTrimming
    }()
    
    lazy var reservationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.setTitle("Reservation Now", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
        additionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {

        addSubview(HelloLabel)
        addSubview(nameLabel)
        addSubview(dividerView)
        addSubview(servicesLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(stackViewTop)
        stackView.addArrangedSubview(stackViewBotton)
        stackViewTop.addArrangedSubview(buttonShaving)
        stackViewTop.addArrangedSubview(buttonHairWashing)
        stackViewBotton.addArrangedSubview(buttonHairCare)
        stackViewBotton.addArrangedSubview(buttonBeardTrimming)
        addSubview(reservationButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            HelloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            HelloLabel.leadingAnchor.constraint(equalTo: servicesLabel.leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: HelloLabel.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: servicesLabel.leadingAnchor),
            
            dividerView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
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
    
    func setupDelegate(delegate: ReservationViewControllerProtocol) {
        self.delegate = delegate
    }
    
    @objc private func tappedButton() {
        delegate?.didTapButton()
    }
    
    private func additionalConfig() {}
}
