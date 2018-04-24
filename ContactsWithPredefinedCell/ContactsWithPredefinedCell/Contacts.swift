//
//  Contact.swift
//  Contacts
//
//  Created by Ada 2018 on 24/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation
import UIKit

class Contact{
    
    var name: String
    var phone: String
    var image: UIImage = #imageLiteral(resourceName: "contact-avatar")
    
    init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

