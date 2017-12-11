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
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>
        {
            if let min = temp["temp_min"] as? Double
            {
                let KtoC = min-273.15;
                self._lowTemp = "\(KtoC)";
                print(self.lowTemp)
            }
            
            if let max = temp["temp_max"] as? Double
            {
                let KtoC = max-273.15;
                self._highTemp = "\(KtoC)";
                print(self.highTemp)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]
        {
            if let main = weather[0]["main"] as? String
            {
                self._weatherType = main;
            }
            
        }
        if let date = weatherDict["dt"] as? Double
        {
            let unixConvertedDate = Date(timeIntervalSince1970: date);
            let dateFormatter = DateFormatter();
            dateFormatter.dateStyle = .full ;
            dateFormatter.dateFormat = "EEEE";
            dateFormatter.timeStyle = .none ;
            self._date = unixConvertedDate.dayOfTheWeek();
           print(self.date)
            
            
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

