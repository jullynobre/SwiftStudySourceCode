//
//  ViewController+CollectionVIewDataSource.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let key = self.photos.keys.sorted{ $0>$1 }[section]
        
        guard let photosCount = self.photos[key]?.count else { return 0 }
        
        return photosCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath)
        
        let key = self.photos.keys.sorted{$0 > $1} [indexPath.section]
        
        guard let photo = self.photos[key]?[indexPath.row] else{ return cell }
        
        cell.backgroundView = UIImageView.init(image: photo.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        
        header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        
        
        let key = self.photos.keys.sorted{$0 > $1} [indexPath.section]
        
        guard let photo = self.photos[key]?[indexPath.row] else{ return header }
        
        let lbSectionTitle = UILabel(frame: CGRect(x: 0.5, y: 0.5, width: 200, height: 20))
        lbSectionTitle.text = photo.date
        
        header.addSubview(lbSectionTitle)
        
        return header
        
    }
}
