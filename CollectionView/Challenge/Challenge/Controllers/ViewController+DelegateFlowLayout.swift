//
//  ExtensionViewControllerDelegateFlowLayout.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: collectionView.frame.width, height: 100)
        }
        return CGSize(width: (collectionView.frame.width - 20) / 3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return isInSelectionMode
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.layer.borderWidth = 2
        cell?.layer.borderColor = UIColor.cyan.cgColor
        
        self.bbiTrash.isEnabled = true
        
        let key = self.photos.keys.sorted{ $0>$1 }[indexPath.section]
        var photo = self.photos[key]![indexPath.row]
        photo.isSelected = !photo.isSelected
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        cell?.layer.borderWidth = 0
        
        let key = self.photos.keys.sorted{ $0>$1 }[indexPath.section]
        //var photo = self.photos[key]![indexPath.row]
        //photo.isSelected = false
        
        let areThereItemsSelected = self.photos.filter{$0.value.filter{$0.isSelected}.count > 0
        }.count > 0
        
        if !areThereItemsSelected {
            
            self.bbiTrash.isEnabled = false
            
        }
        
    }
    
}
