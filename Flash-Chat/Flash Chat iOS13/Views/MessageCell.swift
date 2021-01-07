//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by dev.geeyong on 2021/01/06.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var messageBackgroundView: UIView!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBackgroundView.layer.cornerRadius = messageBackgroundView.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
