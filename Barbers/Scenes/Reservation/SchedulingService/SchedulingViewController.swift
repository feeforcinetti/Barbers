//
//  SchedulingViewController.swift
//  Barbers
//
//  Created by Felipe Forcinetti on 10/01/24.
//

import Foundation
import UIKit

class SchedulingViewController: UIViewController {
    
    //MARK: Variables
    private unowned var screenView: SchedulingView { return self.view as! SchedulingView }
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
        self.view = SchedulingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.configCollectionViewDelegate(delegate: self, dataSource: self)
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

extension SchedulingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hairCutImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SchedulingViewCell.identifier, for: indexPath) as? SchedulingViewCell
        
        cell?.setupCell(data: hairCutImage[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
}
