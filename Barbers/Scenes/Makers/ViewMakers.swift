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
        isBold: Bool = false
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        if let color {
            label.backgroundColor = color
        }
        label.textColor = textColor
        label.font = .systemFont(ofSize: fontSize, weight: isBold ? .bold : .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

//MARK: - UIButton
extension UIButton {
    static func button(
        title: String = "",
        cornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        titleLabel: UIFont? = UIFont.systemFont(ofSize: 12.0),
        titleColor: UIColor? = .black,
        backgroundColor: UIColor? = .systemBackground,
        contentEdgeInsets: UIEdgeInsets? = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0),
        target: Any?,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .custom)
                
        if let cornerRadius, let borderWidth, let borderColor, let contentEdgeInsets {
            button.layer.cornerRadius = cornerRadius
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor.cgColor
            button.contentEdgeInsets = contentEdgeInsets
        }
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = titleLabel
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.addTarget(target, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        
        if let nibName, let identifier {
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
        
        if let registerCell, let identifier {
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
