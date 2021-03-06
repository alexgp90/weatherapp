//
//  WeatherVC
//  rainyshinycloudy
//
//  Created by MacOSX on 11/5/17.
//  Copyright © 2017 AppsFromAlex. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate{

    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager();
    var currentLocation: CLLocation!
    
    
    
    //http://api.openweathermap.org/data/2.5/weather?id=683506&appid=f8854d6ba5a42f0145f656f4b9fd3015
    
    var currentWeather = CurrentWeather();
    var forecast = Forecast!.self
    var forecasts = [Forecast]();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestWhenInUseAuthorization();
        locationManager.startMonitoringSignificantLocationChanges();
        locationManager.requestLocation();
        
        //print(CURRENT_WEATHER_URL);

        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self;
        tableView.dataSource = self;
        
       // print(FORECAST_WEATHER_URL);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell
        {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast);
            
            return cell;
        }
        
        else
        {
            return WeatherCell();
        }
    }
    
    func updateMainIU()
    {
        DateLabel.text = currentWeather.date;
       
        currentTempLabel.text = "\(NSString(format: "%.1f", currentWeather.currentTemp).doubleValue)";
        currentWeatherType.text = currentWeather.weatherType;
        locationLabel.text = currentWeather.cityName;
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType);
        
    }
      func downloadForecast(completed:  @escaping DownloadComplete )
      {
        let forecastURL = URL(string: FORECAST_WEATHER_URL);
        Alamofire.request(forecastURL!).responseJSON
            {
                response in
                let result = response.result;
                //print (response); //just for debbuging purposes
                
                if let dict = result.value as? Dictionary <String, AnyObject>{
                    if let list = dict ["list"] as? [Dictionary<String, AnyObject>]
                    {
                        for obj in list
                        {
                            let forecast = Forecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                           // print(obj);
                        }
                        self.tableView.reloadData();
                    }
                }
                
                
                completed();
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0]
        
        // Save the location data
        Location.sharedInstance.latitude = userLocation.coordinate.latitude
        Location.sharedInstance.longitude = userLocation.coordinate.longitude
        currentWeather.downloadWeatherDetails
            {
                self.downloadForecast{
                    self.updateMainIU();
                }
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Hardwire longitude and lattiude coor to Vancouver in case location is denied
        Location.sharedInstance.latitude = 49.25
        Location.sharedInstance.longitude = -123.12
        currentWeather.downloadWeatherDetails
            {
                self.downloadForecast{
                    self.updateMainIU();
                }
        }
 }
    
}

