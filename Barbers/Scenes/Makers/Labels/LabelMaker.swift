//
//  LabelMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

//MARK: - UILabel
extension UILabel {
    static func label(
        text: String = "",
        color: UIColor? = nil,
        textColor: UIColor = .white,
        fontSize: CGFloat = 13,
        fontType: UIFont.Weight = .medium
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize, weight: fontType)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if let color {
            label.backgroundColor = color
        }
        
        return label
    }
}
