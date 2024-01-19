//
//  Alert.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 18/01/24.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(
        title: String? = nil,
        message: String? = nil,
        preferredStyle: UIAlertController.Style = .alert,
        hasTwoButtons: Bool = false,
        okButtonTitle: String? = nil,
        okAction: (() -> Void)? = nil,
        cancelButtonTitle: String? = nil,
        cancelAction: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        alert.addAction(UIAlertAction(title: okButtonTitle, style: .default, handler: { action in
            okAction?()
        }))
        
        if hasTwoButtons {
            alert.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { _ in
                cancelAction?()
            }))
        }
        
        self.present(alert, animated: true)
    }
}
