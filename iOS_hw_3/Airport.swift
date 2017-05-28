//
//  File.swift
//  iOS_hw_3
//
//  Created by 鍾妘 on 2017/5/28.
//  Copyright © 2017年 soslab. All rights reserved.
//

import Foundation

class Airport {
    
    var name: String
    var shortName: String
    var servedCity: String
    var IATA: String
    var country: String
    
    init(name: String, shortName: String, servedCity: String, IATA: String, country: String) {
        self.name = name
        self.shortName = shortName
        self.servedCity = servedCity
        self.IATA = IATA
        self.country = country
    }
    
}
