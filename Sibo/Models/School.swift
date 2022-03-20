//
//  School.swift
//  Sibo
//
//  Created by Sardar Saqib on 03/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import Foundation


class Global {
    
    class var shared : Global {
        
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
 
    }
    
    var schoolInfo : School?
}


class School:Codable {
    
    
   var School_Id: String?
   var Schoool_Name: String?
   var OwnerName: String?
   var SchoolEmail: String?
   var SChool_Contact: String?
   var SchoolInfo: String?
   var QR_Code: String?
   var School_Status: String?
   var qr_image_id: String?
   var qr_image: String?
   var q_r_Code: String?
    
  
    init(data : NSDictionary) {
        self.School_Id = data.object(forKey: "School_Id") as? String ?? ""
        self.Schoool_Name = data.object(forKey: "Schoool_Name") as? String ?? ""
        self.OwnerName = data.object(forKey: "OwnerName") as? String ?? ""
        self.SchoolEmail = data.object(forKey: "SchoolEmail") as? String ?? ""
        self.SChool_Contact = data.object(forKey: "SChool_Contact") as? String ?? ""
        self.SchoolInfo = data.object(forKey: "SchoolInfo") as? String ?? ""
        self.QR_Code = data.object(forKey: "QR_Code") as? String ?? ""
        self.School_Status = data.object(forKey: "School_Status") as? String ?? ""
        self.qr_image_id = data.object(forKey: "qr_image_id") as? String ?? ""
        self.qr_image = data.object(forKey: "qr_image") as? String ?? ""
        self.q_r_Code = data.object(forKey: "q_r_Code") as? String ?? ""
        
    }
}
