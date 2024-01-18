//
//  StackViewMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import Foundation
import UIKit

//MARK: - UIStackView
extension UIStackView {
    static func stackView(
        backgroundColor: UIColor? = nil,
        axis: NSLayoutConstraint.Axis = .horizontal,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = 0,
        cornerRadius: CGFloat = 0
    ) -> UIStackView {
        let stackView = UIStackView()
        stackView.backgroundColor = backgroundColor
        stackView.alignment = alignment
        stackView.axis = axis
        stackView.distribution = distribution
        stackView.spacing = spacing
        stackView.layer.cornerRadius = cornerRadius
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
