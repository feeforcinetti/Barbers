//
//  Coordinator.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/01/24.
//

import UIKit

public protocol Coordinator {
    var presenter: UINavigationController { get  set }
    
    func start()
}
