//
//  ContactTableViewCell.swift
//  ContactsTableViewSolution
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contactImage.layer.masksToBounds = true
        self.contactImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
