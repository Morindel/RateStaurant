//
//  Constants.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Alamofire

struct Constants {
    
    static let apiKey = "3168bd9ae31f8fa577589ac13b7318be"
    
    static let deviceScreenWidth = UIScreen.main.bounds.width
    
    struct API {
        static let headers: HTTPHeaders = [
            "user-key": Constants.apiKey,
            "Accept": "application/json"
        ]
    }
    
}
