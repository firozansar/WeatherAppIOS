//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Firoz Ansari on 24/07/2016.
//  Copyright © 2016 Firoz Ansari. All rights reserved.
//

import Foundation
import Alamofire

protocol WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String){
        
        let nameEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(nameEscaped)&appid=955cf71f7b2404f0405a590374db8a76"
        let url = NSURL(string: path)
        //let session = NSURLSession.sharedSession()
        //let task = session.dataTaskWithURL( url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
         //   print(data)
        //}
        
        //task.resume()
        Alamofire.request(.GET, url!).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    //print("JSON: \(json)")
                    //let lon = json["coord"]["lon"].double
                    //let lat = json["coord"]["lat"].double
                    let temp = json["main"]["temp"].double
                    let name = json["name"].string
                    let desc = json["weather"][0]["description"].string
                    
                    let weather = Weather(cityName: name!, temp: temp!, description: desc!)
                    if(self.delegate != nil){
                    self.delegate?.setWeather(weather)
                    }
                }
            case .Failure(let error):
                print(error)
            }
        }        
    
    }
        
        
}

