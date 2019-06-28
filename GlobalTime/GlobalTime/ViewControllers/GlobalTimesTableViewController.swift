//
//  GlobalTimesTableViewController.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class GlobalTimesTableViewController: UITableViewController {
    
    var timeIdentifiers :[String] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "World Clock"
        self.getCurrentIdentifier()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeIdentifiers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let customCell = cell as? ClockTableViewCell else {return UITableViewCell()}
            let identifier = timeIdentifiers[indexPath.row]
            customCell.identifier = identifier
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTimeZoneTableVC" {
        guard let destVC = segue.destination as? TimeZoneTableViewController else {return}
            destVC.delegate = self
        //you can also do this part through cellForRowAt
        }
    }
    
    func getCurrentIdentifier() {
        let identifier = TimeZone.current.identifier
        self.timeIdentifiers.append(identifier)
    }

}

extension GlobalTimesTableViewController: TimeZoneDelegate {
    
    func didChooseTimeZone(_ timezone: String) {
        self.timeIdentifiers.append(timezone)
        navigationController?.dismiss(animated: true, completion: nil)
        return
    }
}
