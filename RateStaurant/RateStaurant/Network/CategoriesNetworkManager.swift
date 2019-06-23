//
//  CategoriesNetworkManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 23/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreData
import Alamofire

class CategoriesNetworkManager : NetworkManager {
    
    
    static func getRestaurantCategories() {
        
        request("https://developers.zomato.com/api/v2.1/categories", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON(completionHandler: {(response) in
            
            guard let data = response.data else {
                return
            }
            print(response.value)
            do {
                let categories = try JSONDecoder().decode(  CategoriesModel.self, from: data)
            
            print(categories)
            }
            catch let jsonError {
                print(jsonError.localizedDescription)
            }
        })
 
    }
}
