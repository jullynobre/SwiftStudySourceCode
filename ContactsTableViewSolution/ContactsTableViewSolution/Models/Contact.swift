//
//  ContactMO.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 27/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit
import CoreData

class Contact {
    
    var name: String
    var phone: String
    var photo: UIImage = #imageLiteral(resourceName: "contact-avatar")
    
    init(WithName name: String, phone: String, photo: UIImage?) {
        self.name = name
        self.phone = phone
        
        if let photoUnwrapped = photo{
            self.photo = photoUnwrapped
        }
    }
}
