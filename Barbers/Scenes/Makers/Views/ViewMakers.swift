//
//  ViewMakers.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 18/07/23.
//

import UIKit

//MARK: - UIView
extension UIView {
    static func simpleView(color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
