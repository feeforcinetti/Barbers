//
//  TableViewMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import Foundation
import UIKit

//MARK: - TableView
extension UITableView {
    static func tableView(
        isScrollEnabled: Bool = true,
        showsVerticalScrollIndicator: Bool = false,
        separatorStyle:UITableViewCell.SeparatorStyle = .none ,
        allowsSelection: Bool = true,
        nibName: UINib? = nil,
        identifier: String? = nil
    ) -> UITableView {
        let tableView = UITableView()
        tableView.isScrollEnabled = isScrollEnabled
        tableView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        tableView.separatorStyle = separatorStyle
        tableView.allowsSelection = allowsSelection
        
        if let nibName = nibName, let identifier = identifier {
            tableView.register(nibName, forCellReuseIdentifier: identifier)
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
}
