//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Firoz Ansari on 24/07/2016.
//  Copyright © 2016 Firoz Ansari. All rights reserved.
//

import Foundation

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String){
        print("Weather service city: \(city)")
        
        let weather = Weather(cityName: city, temp: 25, description: "A nice day")
        
        if(delegate != nil){
            delegate?.setWeather(weather)
        }
    }
}
