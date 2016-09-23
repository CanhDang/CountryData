//
//  MainViewController.swift
//  CountryData
//
//  Created by HoangHai on 9/19/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

let kDOCUMENT_DIRECTORY_PATH = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true).first

class MainViewController: UIViewController {
    
    var countries = [Country]()
    var array: NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()

       getData()
       //downloadFlag()
       checkFlag()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getData(){
        if let path = Bundle.main.path(forResource: "response", ofType: "json") {
            do {
               let jsonData = try NSData(contentsOfFile: path, options: .mappedIfSafe)
                if let jsonResult: Array<AnyObject> = try JSONSerialization.jsonObject(with: jsonData as Data, options: .mutableContainers) as? Array<AnyObject> {
    
                    for item in jsonResult {
                        let name = item["name"] as! String
                        let alpha2Code = item["alpha2Code"] as! String
                        let alpha3Code = item["alpha3Code"] as! String
                        let callingCodes = item["callingCodes"] as! [String]
                        let capital = item["capital"] as! String
                        let region = item["region"] as! String
                        let subregion = item["subregion"] as! String
                        let population = item["population"] as! Int
                        
                        let latlng = item["latlng"] as! [Float]
                        
                        let latitude = latlng[0]
                        let longitude = latlng[1]
                        
                        let demonym = item["demonym"] as! String
                        
                        var area: Int!
                        if !(item["area"] is NSNull) {
                            area = item["area"] as! Int
                        } else {
                            area = -1
                        }
                        
                        var timezones: [String]!
                        
                        if !(item["timezones"] is NSNull) {
                            timezones = item["timezones"] as! [String]
                        } else {
                            timezones = [""]                        }
                        
                        let currencies = item["currencies"] as! [String]
                        let languages = item["languages"] as! [String]
                        
                        let country = Country(name: name, alpha2Code: alpha2Code, alpha3Code: alpha3Code, callingCodes: callingCodes, capital: capital, region: region, subregion: subregion, population: population, latitude: latitude, longitude: longitude, demonym: demonym, area: area,timezones: timezones, currencies: currencies, languages: languages)
                        countries.append(country)
                    }
                    
                }
            } catch {
                print(error)
            }
           
        }
    }
    
    func downloadFlag() {
        let baseURL = "http://www.geognos.com/api/en/countries/flag/"
        for country in countries {
            let alpha2Code = country.alpha2Code
            let link = baseURL + "\(alpha2Code!).png"
            print(link)
            let data = try? Data(contentsOf: URL(string: link)!)
            
            if let dir = kDOCUMENT_DIRECTORY_PATH {
                print(dir)
                let path = "\(dir)/\(alpha2Code!).png"
                try? data?.write(to: URL(fileURLWithPath: path), options: [.atomic])
            }
        }
    }
    
    func checkFlag(){
        print("*********************")
        
        for country in countries {
            let alpha2Code = country.alpha2Code!
            
            let name = "\(alpha2Code).png"
            if UIImage(named: name) != nil {
                
            } else {
                print(name, country.name)
            }
        }
        print("*********************")
    }
    
    
    func getTimeZones() {
        let baseURL = "https://tehuano-time-zone-v1.p.mashape.com/api2/timezone/"
        
        for country in countries {
            
        }
    }
    
    @IBAction func action_showAllCountries(_ sender: AnyObject) {
        let collectionView = self.storyboard?.instantiateViewController(withIdentifier: "CollectionViewCountry") as? CollectionViewController
        collectionView?.listCountries = countries
        self.navigationController?.pushViewController(collectionView!, animated: true)
        
        
    }

    
}
