//
//  Weather.swift
//  WeatherApp
//
//  Created by Firoz Ansari on 24/07/2016.
//  Copyright © 2016 Firoz Ansari. All rights reserved.
//

import Foundation

struct Weather{
    let cityName: String
    let temp: Double
    let description: String
    
    init(cityName: String, temp: Double, description: String){
        self.cityName = cityName
        self.temp = temp
        self.description = description
    }
}
