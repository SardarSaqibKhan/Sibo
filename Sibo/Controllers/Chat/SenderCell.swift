//
//  SenderCell.swift
//  Sibo
//
//  Created by Sardar Saqib on 09/10/2019.
//  Copyright © 2019 Sardar Saqib. All rights reserved.
//

import UIKit

class SenderCell: UITableViewCell {

    
    @IBOutlet weak var outgoingMessage: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
  
    @IBOutlet weak var bubbleViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var bubbleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
