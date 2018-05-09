//
//  Converter.swift
//  Challenge
//
//  Created by Ada 2018 on 08/05/18.
//  Copyright © 2018 Academy 2018. All rights reserved.
//

import Foundation

class Converter{
    
    static func stringFromDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        return dateFormatter.string(from: date)
    }
    
}
