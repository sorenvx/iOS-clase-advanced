//
//  NationalityCell.swift
//  CursoiOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 clasegetafe. All rights reserved.
//

import UIKit

class NationalityCell: UITableViewCell {
    static let cellIdentifier = String(describing: NationalityCell.self)
    static let cellHeight: CGFloat = 105
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    let flagOptions = ["ES", "DK", "NO", "JP", "BY", "FI", "GB", "DE", "FR", "IS", "GR", "BR", "BE", "FJ", "AU", "NL", "BM", "SE", "MA"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure(collectionView: mCollectionView)
    }
    
}


extension NationalityCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Configure tableview with default options
    func configure(collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        flagOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NationalityCollectionViewCell.cellIdentifier, for: indexPath) as? NationalityCollectionViewCell else {
            return UICollectionViewCell()
        }
        //            let flagEmoji = flag(country: flagOptions)
        cell.mLabel.text = flag(country: flagOptions[indexPath.row])
        
        return cell
    }
    
    
    func flag(country: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
