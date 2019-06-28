//
//  ClockTableViewCell.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

/* not neccessary since I can get the time with abbreviation based on identifier
enum TimeZoneCity: String {
    case LA = "Los_Angeles"
    case NY = "New_York"
}
*/
 


class ClockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeZoneNameLabel: UILabel!
    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var cellContentView: UIView!
    
    
    var identifier: String? {
        didSet {
            updateViews()
        }
    }

    //KeyPoints
    //TimeZone(identifier: "identifier")?.abbreviation() will give you abbreviation for getting the time
    //now I can pass whole identifier to an array instead of just cityNames
    
    func updateViews() {
        guard let identifier = identifier,
            let abb = TimeZone(identifier: identifier)?.abbreviation() else {return}
            self.clockView.timezone = TimeZone(abbreviation: abb)
        
            //get cityname
            let city = String(identifier.split(separator: "/")[1])
            self.timeZoneNameLabel.text = city
    }
}



