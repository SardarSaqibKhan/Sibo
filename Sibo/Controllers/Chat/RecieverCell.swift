//
//  RecieverCell.swift
//  Sibo
//
//  Created by Sardar Saqib on 09/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit

class RecieverCell: UITableViewCell {
    
    @IBOutlet weak var incomingMessage: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
