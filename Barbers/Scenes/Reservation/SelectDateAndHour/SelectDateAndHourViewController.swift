//
//  SelectDateAndHourViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/24.
//

import Foundation
import UIKit

class SelectDateAndHourViewController: UIViewController {
    
    //MARK: Variables
    private unowned var screenView: SelectDateAndHourView { return self.view as! SelectDateAndHourView }
    var hairCutImage: [HairCutModel] = [HairCutModel(image: "barba"), HairCutModel(image: "barba"), HairCutModel(image: "barba"), HairCutModel(image: "barba"), HairCutModel(image: "barba"), HairCutModel(image: "barba"), HairCutModel(image: "barba")]
    //MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle
    override func loadView() {
        super.loadView()
        self.view = SelectDateAndHourView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.configCollectionViewDelegate(delegate: self, dataSource: self)
        
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.title = "Reservar"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension SelectDateAndHourViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hairCutImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectHairCutViewCell.identifier, for: indexPath) as? SelectHairCutViewCell
        
        cell?.setupCell(data: hairCutImage[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
}
