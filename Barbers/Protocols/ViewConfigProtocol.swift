//
//  File.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 05/10/21.
//

import Foundation

public protocol ViewConfigure {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfigure {
    func configureViews() {
        buildHierarchy()
        setupConstraints()
    }
}
