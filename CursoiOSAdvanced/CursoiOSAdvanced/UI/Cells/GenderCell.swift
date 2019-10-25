//
//  GenderCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class GenderCell: UITableViewCell {
    static let cellIdentifier = String(describing: GenderCell.self)
    static let cellHeight: CGFloat = 112
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mCollectionView: UICollectionView!
    @IBOutlet weak var mLabel: UILabel!
    
    let genderOptions = ["Hombre","Mujer"]
    var selectedIndexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(collectionView: mCollectionView)
    }
    

  
}



extension GenderCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Configure tableview with default options
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        genderOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenderCollectionViewCell.cellIdentifier, for: indexPath) as? GenderCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.mLabel.text = genderOptions[indexPath.row]
        
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

    }
}
