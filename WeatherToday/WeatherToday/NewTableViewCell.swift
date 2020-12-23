//
//  NewTableViewCell.swift
//  WeatherToday
//
//  Created by dev.geeyong on 2020/12/23.
//

import UIKit

class NewTableViewCell: UITableViewCell {

 
    @IBOutlet var weatherImage: UIImageView!
    
    @IBOutlet var weatherCityName: UILabel!
    
    @IBOutlet var temperature: UILabel!
    
    @IBOutlet var probability: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
