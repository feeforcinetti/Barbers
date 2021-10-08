//
//  ReservationViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 08/10/21.
//

import Foundation
import UIKit

class ReservationView: UIView, ViewConfigureProtocol {
   
    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
       
        return stackView
    }()
    
    lazy var buttonShaving: UIButton = {
       let buttonShaving = UIButton()
        
        return buttonShaving
    }()
    
    lazy var buttonHairWashing: UIButton = {
       let buttonHairWashing = UIButton()
        
        return buttonHairWashing
    }()
    
    lazy var buttonHairCare: UIButton = {
       let buttonHairCare = UIButton()
        
        return buttonHairCare
    }()
    
    lazy var buttonBeardTrimming: UIButton = {
       let buttonBearTrimming = UIButton()
        
        return buttonBearTrimming
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            //StackView
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
}
