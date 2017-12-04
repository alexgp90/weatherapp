//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by X on 11/27/17.
//  Copyright © 2017 AppsFromAlex. All rights reserved.
//

import Foundation

//lat=35&lon=139&appid=f8854d6ba5a42f0145f656f4b9fd3015

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?";
let LATITUDE = "lat=44.4323";
let LONGITUDE = "&lon=26.1063";
let APP_ID = "&appid=";
let API_KEY = "f8854d6ba5a42f0145f656f4b9fd3015";

typealias DownloadComplete = () -> ();

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"


let BASE_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast?";
let FORECAST_WEATHER_URL = "\(BASE_URL_FORECAST)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"
