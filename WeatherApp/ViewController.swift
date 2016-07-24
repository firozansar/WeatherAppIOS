//
//  ViewController.swift
//  WeatherApp
//
//  Created by Firoz Ansari on 23/07/2016.
//  Copyright © 2016 Firoz Ansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {

    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    let weatherService = WeatherService()
    
    @IBAction func setCityTapped(sender: UIButton) {
        print("City button tapped")
        openCityAlert()
    }
    
    func openCityAlert(){
        let alert = UIAlertController(title: "City", message: "Enter city name", preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            let textfield = alert.textFields?[0]
            print(textfield?.text!)
            self.cityLabel.text = textfield?.text!
            self.weatherService.getWeather((textfield?.text)!)
            
        })
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextFieldWithConfigurationHandler { (textfield: UITextField) in
            textfield.placeholder = "City name"
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func setWeather(weather: Weather) {
        self.tempLabel.text = String(weather.temp)
        self.descLabel.text = weather.description
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherService.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

