//
//  LocationModel.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 28/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationModel : Codable {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var coordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    let latitude: Double
    let longitude: Double
    let date: Date
    let dateString: String
    let description: String
    
    init(_ location: CLLocationCoordinate2D, date: Date, descriptionString: String) {
        latitude =  location.latitude
        longitude =  location.longitude
        self.date = date
        dateString = LocationModel.dateFormatter.string(from: date)
        description = descriptionString
    }
    
    init(visit: CLVisit, descriptionString: String) {
        self.init(visit.coordinate, date: visit.arrivalDate, descriptionString: descriptionString)
    }
}
