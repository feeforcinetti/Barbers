//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import Foundation
import UIKit
//
//protocol ReservationViewControllerProtocol: AnyObject {
//    
//}

class ReservationView: UIView, ViewConfigureProtocol {
    
//    lazy var viewButton: UIImageView = {
//        let view = UIImageView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.image = UIImage(named: "menu")
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
    
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
//        loginButton.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func buildHierarchy() {

        self.addSubview(self.HelloLabel)
        self.addSubview(self.nameLabel)
        self.addSubview(self.dividerView)
        self.addSubview(self.servicesLabel)
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.stackViewTop)
        self.stackView.addArrangedSubview(self.stackViewBotton)
        self.stackViewTop.addArrangedSubview(self.buttonShaving)
        self.stackViewTop.addArrangedSubview(self.buttonHairWashing)
        self.stackViewBotton.addArrangedSubview(self.buttonHairCare)
        self.stackViewBotton.addArrangedSubview(self.buttonBeardTrimming)
        self.addSubview(self.reservationButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.HelloLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            self.HelloLabel.leadingAnchor.constraint(equalTo: self.servicesLabel.leadingAnchor),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.HelloLabel.bottomAnchor, constant: 8),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.servicesLabel.leadingAnchor),
            
            
            self.dividerView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            self.dividerView.leadingAnchor.constraint(equalTo: self.buttonShaving.leadingAnchor),
            self.dividerView.trailingAnchor.constraint(equalTo: self.buttonHairWashing.trailingAnchor),
            self.dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            self.servicesLabel.topAnchor.constraint(equalTo: self.dividerView.bottomAnchor, constant: 40),
            self.servicesLabel.leadingAnchor.constraint(equalTo: self.buttonShaving.leadingAnchor),
            self.servicesLabel.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: -10),
            
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            self.stackViewTop.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 20),
            self.stackViewTop.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 20),
            self.stackViewTop.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -20),

            self.stackViewBotton.leadingAnchor.constraint(equalTo: self.stackViewTop.leadingAnchor),
            self.stackViewBotton.trailingAnchor.constraint(equalTo: self.stackViewTop.trailingAnchor),
            self.stackViewBotton.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -20),
            
            self.buttonShaving.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 20),
            self.buttonShaving.heightAnchor.constraint(equalToConstant: 125),
            self.buttonShaving.widthAnchor.constraint(equalToConstant: 125),
            self.buttonShaving.bottomAnchor.constraint(equalTo: self.buttonHairCare.topAnchor, constant: -20),
            
            self.buttonHairCare.heightAnchor.constraint(equalToConstant: 125),
            self.buttonHairCare.widthAnchor.constraint(equalToConstant: 125),
            self.buttonHairCare.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: -20),
            
            self.reservationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.reservationButton.heightAnchor.constraint(equalToConstant: 45),
            self.reservationButton.widthAnchor.constraint(equalToConstant: 280),
            self.reservationButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
            
        ])
    }
    
}
