//
//  GlobalTimesTableViewController.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit
import Foundation

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
        //self.timeIdentifiers.append("Africa/Bamako")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(timeIdentifiers.count)
        return timeIdentifiers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let customCell = cell as? ClockTableViewCell else {return UITableViewCell()}
            let identifier = timeIdentifiers[indexPath.row]
            customCell.identifier = identifier
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let identifier = timeIdentifiers[indexPath.row]
        guard let index = timeIdentifiers.firstIndex(of: identifier) else {return}
        timeIdentifiers.remove(at: index)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    // MARK: - Navigation - this is not assigning this tableVC as delegate of TimeZoneTableVC

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToTimeZoneTableVC" {
            let destNavigationController = segue.destination as! UINavigationController
            let final = destNavigationController.topViewController as! TimeZoneTableViewController
            final.delegate = self
        }
    }
    //Beware, the destination of the segue object is whatever view controller is on the end of the segue from the storyboard. In this app, that is an instance of UINavigationController, so you'll need to dig through the view hierarchy to reach the object you actually want (TimeZonesTableViewController).
    
    func getCurrentIdentifier() {
        let identifier = TimeZone.current.identifier
        self.timeIdentifiers.append(identifier)
    }

}

extension GlobalTimesTableViewController: TimeZoneDelegate {
    
    func didChooseTimeZone(_ timezone: String) {
        self.timeIdentifiers.append(timezone)    //this is not being called.....
       
        print(timeIdentifiers)
        dismiss(animated: true, completion: nil)
    }
}
