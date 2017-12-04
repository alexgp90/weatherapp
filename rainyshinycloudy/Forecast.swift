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

}
