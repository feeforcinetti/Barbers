//
//  LoginView.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import Foundation
import UIKit

class LoginView: UIView, ViewConfigureProtocol {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
       
        return stackView
    }()
    
    lazy var iconImageView: UIView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "barber")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy var spaceView: UIView = {
        let spaceView = UIView(frame: .zero)
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.backgroundColor = .white
        
        return spaceView
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton(frame: .zero)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 20
        loginButton.setTitle("Get a stylish haircut", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        
        
        return loginButton
    }()
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "No, tack me back to mammy"
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textAlignment = .center
        
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(spaceView)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(textLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //StackView
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //iconImageView
            iconImageView.heightAnchor.constraint(equalToConstant: 338),
            iconImageView.widthAnchor.constraint(equalToConstant: 338),
            
            //spaceView
            spaceView.heightAnchor.constraint(equalToConstant: 200),
            spaceView.widthAnchor.constraint(equalToConstant: 2),
            
            //loginButton
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalToConstant: 280),
            
        ])
    }
    
}

