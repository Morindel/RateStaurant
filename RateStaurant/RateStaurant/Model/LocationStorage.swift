//
//  LocationStorage.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 28/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreLocation

class LocationsStorage {
    static let shared = LocationsStorage()
    
    private(set) var locations: [LocationModel]
    private let fileManager: FileManager
    private let documentsURL: URL?
    
    init() {
        let fileManager = FileManager.default
        documentsURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        self.fileManager = fileManager
        self.locations = []
    }
}

