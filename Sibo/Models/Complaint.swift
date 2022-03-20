//
//  Complaint.swift
//  Sibo
//
//  Created by Sardar Saqib on 03/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import Foundation

class Complaint: Codable{
    
    
   var complaint_id: String?
   var Student_id: String?
   var School_Id: String?
   var Comtype_id: String?
   var complainant_type_id: String?
   var Subject: String?
   var com_details: String?
   var incident_date: String?
   var incident_time: String?
   var com_image: String?
   var com_vdo: String?
   var date: String?
   var Complaint_status: String?
   var ComtypeName: String?
    
    
    init(data : NSDictionary) {
        
        self.complaint_id = data.object(forKey: "complaint_id") as? String ?? ""
        self.Student_id = data.object(forKey: "Student_id") as? String ?? ""
        self.School_Id = data.object(forKey: "School_Id") as? String ?? ""
        self.Comtype_id = data.object(forKey: "Comtype_id") as? String ?? ""
        self.complainant_type_id = data.object(forKey: "complainant_type_id") as? String ?? ""
        self.Subject = data.object(forKey: "Subject") as? String ?? ""
        self.com_details = data.object(forKey: "com_details") as? String ?? ""
        self.incident_date = data.object(forKey: "incident_date") as? String ?? ""
        self.incident_time = data.object(forKey: "incident_time") as? String ?? ""
        self.com_image = data.object(forKey: "com_image") as? String ?? ""
        self.com_vdo = data.object(forKey: "com_vdo") as? String ?? ""
        self.date = data.object(forKey: "date") as? String ?? ""
        self.Complaint_status = data.object(forKey: "Complaint_status") as? String ?? ""
        self.ComtypeName = data.object(forKey: "ComtypeName") as? String ?? ""
        
    }
}
