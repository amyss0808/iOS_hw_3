//
//  AirportTableViewCell.swift
//  iOS_hw_3
//
//  Created by 鍾妘 on 2017/5/28.
//  Copyright © 2017年 soslab. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var IATALabel: UILabel!

    @IBOutlet weak var servedCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
