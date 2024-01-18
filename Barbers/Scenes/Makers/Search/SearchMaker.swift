//
//  SearchMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

extension UISearchBar {
    static func searchBar(textColor: UIColor? = .black) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.textColor = textColor
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }
}
