//
//  ViewController.swift
//  iOS_hw_3
//
//  Created by 鍾妘 on 2017/5/28.
//  Copyright © 2017年 soslab. All rights reserved.
//

import UIKit

class AirportListViewController: UIViewController {
    
    var airportListGroupedByCity : [(country: String, airport: [Airport])] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.airportListGroupedByCity = self.groupAirportByCity(ungroupedAirportList: self.loadAirportData())
        
        print(self.airportListGroupedByCity.count)
        
        print(self.airportListGroupedByCity)
        
    }

    func loadAirportData() -> [Airport] {
        
        let filePath = Bundle.main.path(forResource: "airports", ofType: "plist")
        
        let airports = NSArray(contentsOfFile: filePath!) as! [[String: String]]
        
        var ungroupedAirportList: [Airport] = []
        
        for airport in airports {
            
            let newAirport = Airport(name: airport["Airport"]!, shortName: airport["ShortName"]!, servedCity: airport["ServedCity"]!, IATA: airport["IATA"]!, country: airport["Country"]!)
            
            ungroupedAirportList.append(newAirport)
        }
        
        print(ungroupedAirportList.count)
        return ungroupedAirportList
    }
    
    func groupAirportByCity(ungroupedAirportList: [Airport] ) -> [(country: String, airport: [Airport])] {
        
        var airportListGroupedByCity: [(country: String, airport: [Airport])] = []
        
        var countryList = [String]()
        
        for airport in ungroupedAirportList {
            
            if countryList.contains(airport.country) {
                
                airportListGroupedByCity[countryList.index(of: airport.country)!].airport.append(airport)
                
            } else {
                
                countryList.append(airport.country)
                
                airportListGroupedByCity.append((country: airport.country, airport: [airport]))
                
            }
            
        }
        
        return airportListGroupedByCity
    }
    
}

extension AirportListViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.airportListGroupedByCity[section].airport.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as? AirportTableViewCell else {
            fatalError("Couldn't downcast table cell")
        }
        
        cell.nameLabel.text = self.airportListGroupedByCity[indexPath.section].airport[indexPath.row].name
        
        cell.IATALabel.text = self.airportListGroupedByCity[indexPath.section].airport[indexPath.row].IATA
        
        cell.servedCityLabel.text = self.airportListGroupedByCity[indexPath.section].airport[indexPath.row].servedCity
        
        return cell
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.airportListGroupedByCity.count
        
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.airportListGroupedByCity[section].country
        
    }
    
}

extension AirportListViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier ?? "" {
            
        case "showDetail":
            
            guard let destination = segue.destination as? AirportDetailViewController else {
                fatalError("Unexpected desination in showDetail segue")
            }
            
            guard let selectedAirportCell = sender as? AirportTableViewCell else {
                fatalError("Unexpected cell selected in showDetail segue")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedAirportCell) else {
                fatalError("Cannot find the indexPath of the cell selected in showDetail segue")
            }
            
            destination.airport = self.airportListGroupedByCity[indexPath.section].airport[indexPath.row]
        
        default:
            
            fatalError("Unexpected segue is called in AirportListViewController")
        
        }
    
    }

}
