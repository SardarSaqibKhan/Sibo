//
//  Agent.swift
//  Sibo
//
//  Created by Sardar Saqib on 04/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import Foundation

class Agent: Codable {
    
    
    var Agent_id: String?
    var School_Id: String?
    var Username: String?
    var Password: String?
    var Agent_Status: String?
    var LogInStatus: String?
    
    init(data : NSDictionary) {
        
        self.Agent_id = data.object(forKey: "Agent_id") as? String ?? ""
        self.School_Id = data.object(forKey: "School_Id") as? String ?? ""
        self.Username = data.object(forKey: "Username") as? String ?? ""
        self.Password = data.object(forKey: "Password") as? String ?? ""
        self.Agent_Status = data.object(forKey: "Agent_Status") as? String ?? ""
        self.LogInStatus = data.object(forKey: "LogInStatus") as? String ?? ""
    
        
    }
}
