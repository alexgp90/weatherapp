//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by X on 12/4/17.
//  Copyright © 2017 AppsFromAlex. All rights reserved.
//
import UIKit
import Alamofire

class Forecast
{
    var _date: String!
    var _weatherType: String!
    var _lowTemp: String!
    var _highTemp: String!
    
    var date :String {
        if(_date == nil)
        {
            _date = "";
        }
        return _date;
    }

    var weatherType :String {
        if(_weatherType == nil)
        {
            _weatherType = "";
        }
        return _weatherType;
    }
    var lowTemp :String {
        if(_lowTemp == nil)
        {
            _lowTemp = "";
        }
        return _lowTemp;
    }
    var highTemp :String {
        if(_highTemp == nil)
        {
            _highTemp = "";
        }
        return _highTemp;
    }
    init (weatherDict: Dictionary <String, AnyObject>)
    {
        if let date = weatherDict["dt"] as? Double
        {
            let unixConvertedDate = Date(timeIntervalSince1970: date);
            let dateFormatter = DateFormatter();
           // dateFormatter.dateStyle = .medium ;
            dateFormatter.dateFormat = "E, HH:mm";
            //dateFormatter.timeStyle = .short ;
            self._date = dateFormatter.string(from: unixConvertedDate);
            print(self.date)
            
            
        }
        
        if let main = weatherDict["main"] as? Dictionary<String, AnyObject>
        {
            if let min = main["temp_min"] as? Double
            {
                let KtoC = min-273.15;
                self._lowTemp = "\(NSString(format: "%.1f",KtoC).doubleValue)";

              //  print(self.lowTemp)
            }
            
            if let max = main["temp_max"] as? Double
            {
                let KtoC = max-273.15;
                self._highTemp = "\(NSString(format: "%.1f", KtoC).doubleValue)";

              //  print(self.highTemp)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]
        {
            if let main = weather[0]["main"] as? String
            {
                self._weatherType = main;
            }
            
        }
       
    }

}

extension Date
{
    func dayOfTheWeek()-> String
    {
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEEE";
        return dateFormatter.string(from: self);
    }


}

