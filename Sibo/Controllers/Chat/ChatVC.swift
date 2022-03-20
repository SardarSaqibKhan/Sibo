//
//  ChatVC.swift
//  Sibo
//
//  Created by Sardar Saqib on 08/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit


class ChatVC: BaseViewController {
    
    @IBOutlet weak var conversationTableView: UITableView!
    
    @IBOutlet weak var messageTxt: UITextField!
    
    
    let messages = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n",]
    var conversation = [Chat]()
    let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
       
        getChatHistory()
        textFieldsAllignment()
    }
    @IBAction func send(_ sender: Any) {
        
        if !(messageTxt.text!.isEmpty){
          
            sendMessage(message: messageTxt.text!)
        }
        
       
        
    }
    
    
}
/////////////////////////////// GET CHAT HISTORY ////////////////////////////////////
extension ChatVC{
    func getChatHistory(){
       
        let parameter = ["school_id":"6","agent_id":"10","student_id":"24"] as NSDictionary
        ServiceManager.manager.getChatHistory(url: URL_GET_CHAT, parameters: parameter) { (result, chat, message) in
            if result{
                
                self.conversation = chat
                DispatchQueue.main.async {
                    self.conversationTableView.reloadData()
                    //self.conversationTableView.scrollToRow(at: IndexPath(arrayLiteral: self.conversation.count - 1, at: UITableView.ScrollPosition.bottom, animated: true)
                    self.conversationTableView.scrollToRow(at: IndexPath(row: self.conversation.count - 1, section: 0), at: UITableView.ScrollPosition.bottom, animated: false)
                }
            }
            else{
                if message != ""{
                    
                    self.showAlertMessage(message: message, title: "")
                }
                else{
                    self.showAlertMessage(message: "message", title: "")
                }
            }
        }
    }
}
/////////////////////////////// SEND MESSAGE ////////////////////////////////////
extension ChatVC{
    func sendMessage(message:String){
        
        let parameter = ["school_id":"6","agent_id":"10","agent_name":"farhan","student_id":"24","student_name":"noman","send_by":"0","message":"\(message)"] as NSDictionary
        
        
        ServiceManager.manager.sendMessage(url: URL_SEND_CHAT_MESSAGE, parameters: parameter) { (result, message) in
            
            if result{
                
                self.messageTxt.text = ""
                self.getChatHistory()
            }
            else{
                if message != ""{
                  
                    self.showAlertMessage(message: message, title: "")
                }
                else{
                    self.showAlertMessage(message: "message", title: "")
                }
            }
        }
    
    }
}
/////////////////////////// TABLEVIEW DATA SOUCES ///////////////////////
extension ChatVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return conversation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         var returnCell = UITableViewCell()
        
        let sendBy = conversation[indexPath.row].send_by ?? "0"
        if sendBy == "0"{
         
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "SenderCell", for: indexPath) as! SenderCell
            senderCell.outgoingMessage.text = conversation[indexPath.row].message ?? ""
            senderCell.timeLbl.text = conversation[indexPath.row].date_time ?? ""
            let labelSize = senderCell.outgoingMessage.intrinsicContentSize.width
            print(labelSize)
            
            
            
            
            if labelSize < CGFloat(85) {
                
                DispatchQueue.main.async {
                    
                    //senderCell.viewWidthConstrants.constant = CGFloat(100)
                }
                
            }
            else{
               
                let width = CGFloat(screenSize.width )
                if labelSize >= width{
                    
                     DispatchQueue.main.async {
                    //senderCell.viewWidthConstrants.constant = width - CGFloat(30)
                    }
                }
                else{
               
                     DispatchQueue.main.async {
                     // senderCell.bubbleViewWidthConstraint.constant = CGFloat(labelSize)
                    }
                }
                
            }
           
            
            returnCell = senderCell
        }
        else{
           
            let reciverCell = tableView.dequeueReusableCell(withIdentifier: "RecieverCell", for: indexPath) as! RecieverCell
            reciverCell.incomingMessage.text = conversation[indexPath.row].message ?? ""
            reciverCell.timeLbl.text = conversation[indexPath.row].date_time ?? ""
            returnCell = reciverCell
        }
   
        return returnCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
}
///////////////// TEXTFIELDS ALLIGNMENT  ////////////////
extension ChatVC{
    func textFieldsAllignment(){
        
        self.messageTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.messageTxt.frame.height))
        self.messageTxt.leftViewMode = .always
        
    }
}
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
