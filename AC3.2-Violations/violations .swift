//
//  violations .swift
//  AC3.2-Violations
//
//  Created by Karen Fuentes on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
    let dba: String
    let cuisineDescription: String
    let grade: String?
    let score: String
    let building: String
    let street: String
    let zip: String
    var addressString: String {
        get {
            return "\(building), \(street),\(zip)"
        }
    }
   
    let inspectionDate: String
    let action: String
    let violationCode: String
    let violationDescription: String
    
    init(name: String, cuisineDescription: String, grade: String?, score: String, building: String, street: String, zip: String, inspectionDate: String, action: String, violationCode: String, violationDescription: String) {
        self.dba = name
        self.cuisineDescription = cuisineDescription
        self.grade = grade
        self.score = score
        self.building = building
        self.street = street
        self.zip = zip
        self.inspectionDate = inspectionDate
        self.action = action
        self.violationCode = violationCode
        self.violationDescription = violationDescription
    }
    
    convenience init?(withDict dict: [String:Any]) {
        if let name = dict["dba"] as? String,
            let cuisineDescription = dict["cuisine_description"] as? String,
            let grade = dict["grade"] as? String?,
            let score = dict["score"] as? String,
            let building = dict["building"] as? String,
            let street = dict["street"] as? String,
            let zip = dict["zipcode"] as? String,
            let inspectionDate = dict["inspection_date"] as? String,
            let action = dict["action"] as? String,
            let violationCode = dict["violation_code"] as? String,
            let violationDescription = dict["violation_description"] as? String {
            
            self.init(name: name, cuisineDescription: cuisineDescription, grade: grade, score: score, building: building, street: street, zip: zip, inspectionDate: inspectionDate, action: action, violationCode: violationCode, violationDescription: violationDescription)
        }
        else {
            return nil
        }
    }

    
}
