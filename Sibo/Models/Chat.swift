//
//  Chat.swift
//  Sibo
//
//  Created by Sardar Saqib on 09/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import Foundation

class Chat: Codable {
    
    
    
    var message_id:           String?
    var school_id:            String?
    var student_id:           String?
    var student_name:         String?
    var agent_id:             String?
    var agent_name:           String?
    var send_by:              String?
    var message:              String?
    var date_time:            String?
    
    
    
    init(data : NSDictionary) {
        
        
        self.message_id = data.object(forKey: "message_id") as? String ?? ""
        self.school_id = data.object(forKey: "school_id") as? String ?? ""
        self.student_id = data.object(forKey: "student_id") as? String ?? ""
        self.student_name = data.object(forKey: "student_name") as? String ?? ""
        self.agent_id = data.object(forKey: "agent_id") as? String ?? ""
        self.agent_name = data.object(forKey: "agent_name") as? String ?? ""
        self.send_by = data.object(forKey: "send_by") as? String ?? ""
        self.message = data.object(forKey: "message") as? String ?? ""
        self.date_time = data.object(forKey: "date_time") as? String ?? ""
        
        
        
    }
}

