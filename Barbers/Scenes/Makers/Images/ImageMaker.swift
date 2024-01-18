//
//  ImageViewMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

//MARK: - UIImageView
extension UIImageView {
    static func imageView(
        imageName: String,
        tintColor: UIColor? = nil
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)?.withRenderingMode(tintColor == nil ? .alwaysOriginal : .alwaysTemplate)
        imageView.tintColor = tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

//MARK: - UIImage
extension UIImage {
    static func image(
        with name: String,
        in bundle: Bundle? = nil,
        renderingMode: RenderingMode = .alwaysOriginal
    ) -> UIImage {
        return UIImage(named: name, in: bundle, compatibleWith: nil)?.withRenderingMode(renderingMode) ?? UIImage()
    }
}
