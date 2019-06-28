//
//  ClockTableViewCell.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeZoneNameLabel: UILabel!
    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var cellContentView: UIView!
    
    
    var timeZoneID: String? {
        didSet {
            updateViews()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.clockView.timezone = TimeZone(abbreviation: TimeZone.current.abbreviation() ?? "")
        // TimeZone.init(identifier: <#T##String#>)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func updateViews() {
        guard let timeZoneID = timeZoneID else {return}
            //this would work with city or different code i am guessing so it will show based on city you choose instead of just abbreviation
            self.clockView.timezone = TimeZone(abbreviation: timeZoneID)
        
        if timeZoneID == "PDT" {
            self.timeZoneNameLabel.text = "Los Angeles"
        }
    }

}
