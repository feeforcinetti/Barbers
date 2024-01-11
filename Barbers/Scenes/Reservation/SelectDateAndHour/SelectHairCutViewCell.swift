//
//  SelectHairCutViewCell.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/24.
//

import Foundation
import UIKit

class SelectHairCutViewCell: UICollectionViewCell {
    
    //MARK: Constants
    static let identifier = "SelectHairCutViewCell"
    
    //MARK: Variables
    private lazy var hairCutImage: UIImageView = .imageView(imageName: "barba")
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data: HairCutModel) {
        hairCutImage.image = UIImage(named: data.image)
    }
    
    func buildHierarchy() {
        addSubview(hairCutImage)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            hairCutImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hairCutImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hairCutImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hairCutImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
        ])
    }
}


