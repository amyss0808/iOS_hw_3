//
//  AirportDetailViewController.swift
//  iOS_hw_3
//
//  Created by 鍾妘 on 2017/5/28.
//  Copyright © 2017年 soslab. All rights reserved.
//

import UIKit

class AirportDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var IATALabel: UILabel!

    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var airportImg: UIImageView!
    
    var airport: Airport? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUI()
    }

    func updateUI()  {
        
        guard let airport = self.airport else {
            fatalError("Airport in AirportDetailViewController is nil!")
        }
        
        self.nameLabel.text = airport.name
        
        self.IATALabel.text = airport.IATA
        
        self.countryLabel.text = airport.country
        
        self.cityLabel.text = airport.servedCity
        
        print(airport.servedCity)
        
        self.airportImg.image = UIImage(named: airport.IATA)
    
    }

}
