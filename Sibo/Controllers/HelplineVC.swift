//
//  HelplineVC.swift
//  Sibo
//
//  Created by Abdul on 03/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit

class HelplineVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HelplineVC:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helplinecell") as! helplinecell
        return cell
    }
    
    
}

class helplinecell:UITableViewCell
{
    
    @IBOutlet weak var abuseLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
}
