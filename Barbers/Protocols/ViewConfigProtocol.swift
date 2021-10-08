//
//  File.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import Foundation

public protocol ViewConfigureProtocol {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfigureProtocol {
    func configureViews() {
        buildHierarchy()
        setupConstraints()
    }
}
