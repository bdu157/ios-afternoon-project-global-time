//
//  TimeZoneTableViewController.swift
//  globalTime
//
//  Created by Dongwoo Pae on 6/27/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit
import Foundation

protocol TimeZoneDelegate: class {
    func didChooseTimeZone(_ timezone: String)
}

class TimeZoneTableViewController: UITableViewController {

    var timeIdentifiers = TimeZone.knownTimeZoneIdentifiers
    
    weak var delegate: TimeZoneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return timeIdentifiers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZoneCell", for: indexPath)
        let identifier = timeIdentifiers[indexPath.row]
        let cityName = String(identifier.split(separator: "/").last ?? "nil")
        cell.textLabel?.text = cityName
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedIdentifier = timeIdentifiers[indexPath.row]
            print(selectedIdentifier)
        guard let delegate = delegate else {print("there is no delegate"); return}
            delegate.didChooseTimeZone(selectedIdentifier)
            self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
  
/* not necessary
    //remove GMT since it does not have [1] value
    func getCityName() -> [String] {
        var cityNames: [String] = []
        //not necessary since i am using last insted of [1]
//        guard let index = timeIdentifiers.firstIndex(of: "GMT") else {return [String]()}
//        timeIdentifiers.remove(at: index)
        for i in 0...timeIdentifiers.count - 1 {
            let cityName = String(timeIdentifiers[i].split(separator: "/").last ?? "nil")
            cityNames.append(cityName)
        }
        return cityNames
    }
*/
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
