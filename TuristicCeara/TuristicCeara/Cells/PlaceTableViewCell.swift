//
//  PlaceTableViewCell.swift
//  TuristicCeara
//
//  Created by Ada 2018 on 25/04/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
