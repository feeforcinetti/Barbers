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
    
    func configDelegateItemButton(delegate: ItemButtonProtocol) {
        self.delegate = delegate
    }

    lazy var buttonMenu: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "menu"), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.sizeToFit()
        button.addTarget(self, action: #selector(self.didTappedButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
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
            
        ])
    }
    
}

