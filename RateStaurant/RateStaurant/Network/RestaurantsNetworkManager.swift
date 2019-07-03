//
//  RestaurantsNetworkManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 03/07/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RestauratsNetworkManager : NetworkManager {
    
    static func getNearbyRestaurant(completion: @escaping (BoolenResponse) -> Void) {
       
        let parameters : Parameters = [
            "lat" : 50.0,
            "lon" :50.0
        ]
        request("https://developers.zomato.com/api/v2.1/geocode", method: .get, parameters:[
            "lat" : "50.0",
            "lon" :"50.0"
            ], encoding: URLEncoding.default, headers: Constants.API.headers).responseJSON(completionHandler: {(response) in
            print(response.request)
            switch response.result {
                
            case .success:
                do {
                    
                    guard let data = response.data else {
                        return
                    }
                    let jsonArray = try JSON(data: data)
                    
                    for (_,value) in jsonArray["nearby_restaurants"] {
                        print(value["restaurant"]["name"])
//                        print(value)
                    }
//                    print(jsonArray["nearby_restaurants"][1])
                    completion(.success)
                    
                    return
                }
                    
                catch let jsonError {
                    completion(.failure)
                    print(jsonError.localizedDescription)
                    
                    return
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure)
                
            }
            
        })
    }
}
