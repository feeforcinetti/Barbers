//
//  SchedulingView.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/24.
//

import Foundation
import UIKit

class SchedulingView: UIView, ViewConfigureProtocol {
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Variables
    private lazy var subtitleLabel: UILabel = .label(text: "Reservar",
                                                     textColor: .white,
                                                     fontSize: 24,
                                                     fontType: .bold)
    
    private lazy var dividerView: UIView = .simpleView(color: .white)
    
    private lazy var datePicker: UIDatePicker = .datePicker(datePickerMode: .dateAndTime,
                                                            minimumDate: Date(),
                                                            maximumDate: nil,
                                                            datePickerStyle: .inline)
    
    private lazy var categoryLabel: UILabel = .label(text: "Categorias",
                                                     textColor: .white,
                                                     fontSize: 24,
                                                     fontType: .bold)
    
    private lazy var categoryDescriptionLabel: UILabel = .label(text: "Selecione seu tipo de corte",
                                                                textColor: .white,
                                                                fontSize: 14,
                                                                fontType: .bold)
    
    private lazy var dividerViewTwo: UIView = .simpleView(color: .white)
    
    private lazy var collectionView: UICollectionView = .collectionView(registerCell: SchedulingViewCell.self,
                                                                        identifier: SchedulingViewCell.identifier)
    //MARK: Setup
    func configCollectionViewDelegate(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func buildHierarchy() {
        addSubview(subtitleLabel)
        addSubview(dividerView)
        addSubview(datePicker)
        addSubview(categoryLabel)
        addSubview(dividerViewTwo)
        addSubview(categoryDescriptionLabel)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            subtitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            dividerView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            dividerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            datePicker.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            datePicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            dividerViewTwo.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            dividerViewTwo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dividerViewTwo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            dividerViewTwo.heightAnchor.constraint(equalToConstant: 2),
            
            categoryDescriptionLabel.topAnchor.constraint(equalTo: dividerViewTwo.bottomAnchor, constant: 10),
            categoryDescriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            categoryDescriptionLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: categoryDescriptionLabel.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
