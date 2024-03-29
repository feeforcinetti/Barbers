//
//  ItemButton.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/11/21.
//

import UIKit

protocol ItemButtonProtocol: AnyObject {
    func didTappedButton()
}

class ItemButton: UIView, ViewConfigureProtocol {
    
    var delegate: ItemButtonProtocol?
    
    func configItemButtonDelegate(delegate: ItemButtonProtocol) {
        self.delegate = delegate
    }

    lazy var buttonMenu: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(self.didTappedButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTappedButton() {
        self.delegate?.didTappedButton()
    }
    
    func buildHierarchy() {
        addSubview(self.buttonMenu)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.buttonMenu.topAnchor.constraint(equalTo: self.topAnchor),
            self.buttonMenu.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.buttonMenu.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.buttonMenu.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.buttonMenu.widthAnchor.constraint(equalToConstant: 30),
            self.buttonMenu.heightAnchor.constraint(equalTo: buttonMenu.widthAnchor)
            
        ])
    }
    
    func setupButton(image: String, color: UIColor) {
        let imageButton = UIImage(named: image)
        buttonMenu.setImage(imageButton, for: .normal)
        buttonMenu.tintColor = color
    }
    
}
