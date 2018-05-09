//
//  ViewController+ImagePIcker.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let newPhoto = Photo(image: chosenImage)
        
        let containsDate: Bool = self.photos.contains(where: { (key,value) -> Bool in
            return key == newPhoto.date
        })
        
        if containsDate {
            self.photos[newPhoto.date]?.append(newPhoto)
        } else{
            self.photos[newPhoto.date] = [newPhoto]
        }
        
        self.photosCollectionView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

