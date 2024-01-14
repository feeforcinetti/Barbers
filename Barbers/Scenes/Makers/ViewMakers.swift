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

//MARK: - UILabel
extension UILabel {
    static func label(
        text: String = "",
        color: UIColor? = nil,
        textColor: UIColor = .white,
        fontSize: CGFloat = 13,
        fontType: UIFont.Weight = .medium
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize, weight: fontType)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        if let color {
            label.backgroundColor = color
        }
        
        return label
    }
}

//MARK: - UIButton
extension UIButton {
    static func button(
        title: String = "",
        image: String? = nil,
        imageColor: UIColor? = .clear,
        cornerRadius: CGFloat? = nil,
        clipsToBounds: Bool = false,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        fontSize: CGFloat = 10,
        weightFont: UIFont.Weight = .regular,
        titleColor: UIColor? = .black,
        backgroundColor: UIColor? = .systemBackground,
        target: Any?,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .custom)
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: weightFont)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.addTarget(target, action: action, for: .touchUpInside)
        button.clipsToBounds = clipsToBounds
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if let cornerRadius = cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        
        if let borderWidth = borderWidth {
            button.layer.borderWidth = borderWidth
        }
        
        if let borderColor = borderColor {
            button.layer.borderColor = borderColor.cgColor
        }
        
        if let image = image, let imageColor = imageColor {
            button.setImage(.image(with: image, in: .main, renderingMode: .alwaysTemplate), for: .normal)
            button.tintColor = imageColor
        }
          
        return button
    }
}

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

//MARK: - CollectionView
extension UICollectionView {
    static func collectionView(
        backgroundColor: UIColor = .clear,
        itemSize: CGSize = CGSize(width: 100, height: 100),
        estimatedItemSize: CGSize = CGSize(),
        minimumInteritemSpacing: CGFloat = CGFloat() ,
        minimumLineSpacing: CGFloat = CGFloat(),
        isScrollEnabled: Bool = true,
        showsVerticalScrollIndicator: Bool = false,
        showsHorizontalScrollIndicator: Bool = false,
        separatorStyle:UITableViewCell.SeparatorStyle = .none,
        allowsSelection: Bool = true,
        registerCell: AnyClass? = nil,
        identifier: String? = nil
    ) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = itemSize
        layout.estimatedItemSize = estimatedItemSize
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.minimumLineSpacing = minimumLineSpacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = isScrollEnabled
        collectionView.showsVerticalScrollIndicator = showsVerticalScrollIndicator
        collectionView.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
        collectionView.allowsSelection = allowsSelection
        collectionView.backgroundColor = backgroundColor
        
        if let registerCell = registerCell, let identifier = identifier {
            collectionView.register(registerCell, forCellWithReuseIdentifier: identifier)
        }
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
}

public extension UIDatePicker {
    static func datePicker(
        datePickerMode: UIDatePicker.Mode = .dateAndTime,
        minimumDate: Date? = nil,
        maximumDate: Date? = nil,
        datePickerStyle: UIDatePickerStyle = .inline,
        userInterfaceStyle: UIUserInterfaceStyle = .dark
    ) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = datePickerMode
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        datePicker.preferredDatePickerStyle = datePickerStyle
        datePicker.overrideUserInterfaceStyle = userInterfaceStyle
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }
}

extension UISearchBar {
    static func searchBar(textColor: UIColor? = .black) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.textColor = textColor
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        return searchBar
    }
}
