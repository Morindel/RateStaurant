//
//  NetworkManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var header: [String:String] {
        return ["X-RapidAPI-Host": "ZomatoraygorodskijV1.p.rapidapi.com",
                  "X-RapidAPI-Key": Constants.apiKey,
                  "Content-Type": "application/x-www-form-urlencoded"]
    }
    
}
