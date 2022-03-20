//
//  AllStudentVC.swift
//  Sibo
//
//  Created by Sardar Saqib on 11/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit

class AllStudentVC: UIViewController {

    @IBOutlet weak var studentsTableView: UITableView!
    
    var agents = [Agent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         getagents()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.studentsTableView.reloadData()
    }
    

   
}
extension AllStudentVC : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! searchvcCell
        cell.nameLabel.text = agents[indexPath.row].Username ?? ""
        cell.lastMsgLabel.isHidden = true
        cell.timeStampLabel.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let agenentId = agents[indexPath.row].Agent_id ?? ""
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        vc.agentID = agenentId
        vc.studentORagent = "agent"
        self.present(vc, animated: false, completion: nil)
        
    }
}

extension AllStudentVC{
    func getagents(){
        
        let parameter = ["school_id":"5"] as NSDictionary
        ServiceManager.manager.getagents(url: URL_GET_AGENTS, parameters: parameter) { (result, agent) in
            if result{
                self.agents = agent
                DispatchQueue.main.async {
               
                    self.studentsTableView.reloadData()
                }
               
            }
            else{
                print(agent.count)
            }
        }
    }
}
