//
//  ButtonMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

//MARK: - UIButton
extension UIButton {
    static func button(
        title: String = "",
        image: String? = nil,
        imageColor: UIColor? = .clear,
        cornerRadius: CGFloat? = nil,
        clipsToBounds: Bool = false,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        fontSize: CGFloat = 10,
        weightFont: UIFont.Weight = .regular,
        titleColor: UIColor? = .black,
        backgroundColor: UIColor? = .systemBackground,
        target: Any?,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .custom)
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: weightFont)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.addTarget(target, action: action, for: .touchUpInside)
        button.clipsToBounds = clipsToBounds
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if let cornerRadius = cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        
        if let borderWidth = borderWidth {
            button.layer.borderWidth = borderWidth
        }
        
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor.cgColor
        }
        
        if let image = image, let imageColor = imageColor {
            button.setImage(.image(with: image, in: .main, renderingMode: .alwaysTemplate), for: .normal)
            button.tintColor = imageColor
        }
          
        return button
    }
}
