//
//  File.swift
//  Calendar
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

class Event {
    var name: String
    var date: Date
    var place: String
    var image: UIImage = #imageLiteral(resourceName: "placeholder")
    
    init(withName name: String, date: Date, place:String, image: UIImage?) {
        self.name = name
        self.date = date
        self.place = place
        if let i = image {
            self.image = i
        }
    }
}
