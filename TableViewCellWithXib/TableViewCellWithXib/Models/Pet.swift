//
//  Pet.swift
//  TableViewCellWithXib
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

class Pet{
    var name: String
    var shortDescription: String
    var image: UIImage = #imageLiteral(resourceName: "placeholder")
    
    init(withName name: String, shortDescription: String, image: UIImage?) {
        self.name = name
        self.shortDescription = shortDescription
        
        if let i = image{
            self.image = i
        }
    }
    
}
