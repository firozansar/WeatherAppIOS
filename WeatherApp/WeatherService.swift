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
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=London&appid=955cf71f7b2404f0405a590374db8a76"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL( url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            print(data)
        }
        
        task.resume()
        
    
    }
        
        
}

