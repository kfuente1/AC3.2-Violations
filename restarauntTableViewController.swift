//
//  restarauntTableViewController.swift
//  AC3.2-Violations
//
//  Created by Karen Fuentes on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class restarauntTableViewController: UITableViewController {
    
    var restarauntRating: Violations?
    var restaraunts = [Violations]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
    }
    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violations(withDict: violationDict) {
                    self.restaraunts.append(ep)
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaraunts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaraunt violation", for: indexPath)
        let restaurantViolation = restaraunts[indexPath.row]
        cell.textLabel?.text = restaurantViolation.dba
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedRestarunt = restaraunts[indexPath.row]
        performSegue(withIdentifier: "restarauntDetail", sender: selectedRestarunt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViolationDetailSegue" {
            if let rvc = segue.destination as? RestarauntDetailViewController {
                rvc.restarauntViolation = sender as? Violations
            }
        }
    }
}





