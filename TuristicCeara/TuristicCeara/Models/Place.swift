//
//  Place.swift
//  TuristicCeara
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

class Place{
    var name: String
    var image: UIImage = #imageLiteral(resourceName: "placeholder")
    
    init(withName name: String, image: UIImage?) {
        self.name = name
        
        if let i = image{
            self.image = i
        }
    }
}
