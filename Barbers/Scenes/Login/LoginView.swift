//
//  LoginView.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import Foundation
import UIKit

protocol LoginViewProtocol : AnyObject {
    func actionLoginButton()
}

class LoginView: UIView, ViewConfigureProtocol {
    
    var delegate: LoginViewProtocol?
    
    func configDelegate(delegate: LoginViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "barber-icon")
        imageView.contentMode = .scaleAspectFill
    
        return imageView
    }()
    
    lazy var spaceView: UIView = {
        let spaceView = UIView()
        spaceView.translatesAutoresizingMaskIntoConstraints = false
        spaceView.backgroundColor = .white
        return spaceView
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .white
        loginButton.layer.cornerRadius = 20
        loginButton.setTitle("Get a stylish haircut", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        loginButton.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return loginButton
    }()
    
    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "No, tack me back to mammy"
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
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
    
    @objc private func tappedLoginButton() {
        self.delegate?.actionLoginButton()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            //StackView
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 350),
            iconImageView.widthAnchor.constraint(equalToConstant: 350),
            
            //spaceView
            spaceView.heightAnchor.constraint(equalToConstant: 200),
            spaceView.widthAnchor.constraint(equalToConstant: 2),
            
            //loginButton
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.widthAnchor.constraint(equalToConstant: 280),
            
        ])
    }
    
}

