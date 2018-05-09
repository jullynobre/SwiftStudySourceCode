//
//  Photo.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

struct Photo{
    let image: UIImage
    let date: String
    
    var isSelected: Bool
    
    init(image: UIImage) {
        self.image = image
        self.date = Converter.stringFromDate(date: Date())
        
        self.isSelected = false
    }
}
