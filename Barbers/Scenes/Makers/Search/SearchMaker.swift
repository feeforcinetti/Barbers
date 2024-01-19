//
//  SearchMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import UIKit

extension UISearchBar {
    static func searchBar(textColor: UIColor? = .black, textFieldColor: UIColor? = nil) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.textColor = textColor
        searchBar.searchTextField.backgroundColor = textFieldColor
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }
}
