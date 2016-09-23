//
//  Country.swift
//  CountryData
//
//  Created by HoangHai on 9/19/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import Foundation

class Country {
    var name: String! = nil
    var alpha2Code: String! = nil
    var alpha3Code: String! = nil
    var callingCodes: [String] = []
    var capital: String! = nil
    var region: String! = nil
    var subregion: String! = nil
    var population: Int! = nil
    var latitude: Float! = nil
    var longitude: Float! = nil
    var demonym: String!
    var area: Int! = nil
    var timezones: [String] = []
    var currencies: [String] = []
    var languages: [String] = []
    
    init(name: String, alpha2Code: String, alpha3Code: String, callingCodes: [String], capital: String, region: String, subregion: String, population: Int, latitude: Float, longitude: Float, demonym: String, area: Int, timezones: [String], currencies: [String], languages: [String]) {
        self.name = name
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.callingCodes = callingCodes
        self.capital = capital
        self.region = region
        self.subregion = subregion
        self.population = population
        self.latitude = latitude
        self.longitude = longitude
        self.demonym = demonym
        self.area = area
        self.timezones = timezones
        self.currencies = currencies
        self.languages = languages
        
    }
}
