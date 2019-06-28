//
//  GlobalTimesTableViewController.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

protocol TimeZoneDelegate {
    func didChooseTimeZone(_ timezone: String)
}

class GlobalTimesTableViewController: UITableViewController {
    
    var timeIdentifier :[String] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "World Clock"
        
        let id = TimeZone.current.abbreviation()!
        self.timeIdentifier.append(id)
        print(id)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeIdentifier.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let timeCell = cell as! ClockTableViewCell
        let timeZoneID = timeIdentifier[indexPath.row]
        timeCell.timeZoneID = timeZoneID
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

extension GlobalTimesTableViewController: TimeZoneDelegate {
    
    func didChooseTimeZone(_ timezone: String) {
        return
    }
}
