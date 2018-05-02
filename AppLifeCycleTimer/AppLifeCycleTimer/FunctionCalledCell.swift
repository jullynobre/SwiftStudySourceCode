//
//  FunctionCalledCell.swift
//  AppLifeCycleTimer
//
//  Created by Ada 2018 on 02/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import UIKit

class FunctionCalledCell: UITableViewCell {

    @IBOutlet weak var functionName: UILabel!
    @IBOutlet weak var functionTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


