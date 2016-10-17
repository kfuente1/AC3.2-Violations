//
//  RestarauntDetailViewController.swift
//  AC3.2-Violations
//
//  Created by Karen Fuentes on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit



class RestarauntDetailViewController: UIViewController {
    
    @IBOutlet weak var restarauntName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var violationDetail: UITextView!
    @IBOutlet weak var gradeLabel: UILabel!
    
    var restarauntViolation: Violations?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restarauntName.text = restarauntViolation?.dba
        dateLabel.text = restarauntViolation?.inspectionDate
        violationDetail.text = restarauntViolation?.violationDescription
        gradeLabel.text = restarauntViolation?.grade
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
