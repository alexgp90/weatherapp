//
//  Location.swift
//  rainyshinycloudy
//
//  Created by X on 12/11/17.
//  Copyright © 2017 AppsFromAlex. All rights reserved.
//

import CoreLocation

class Location{

    static var sharedInstance = Location();
    private init()
    {
        
    }
    
    var latitude: Double!
    var longitude: Double!
    
    

}
