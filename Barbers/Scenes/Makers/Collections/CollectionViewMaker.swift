//
//  CollectionViewMaker.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 17/01/24.
//

import Foundation
import UIKit

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
