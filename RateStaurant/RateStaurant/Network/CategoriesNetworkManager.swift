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
import SwiftyJSON

class CategoriesNetworkManager : NetworkManager {
    
    
    static func getRestaurantCategories() {
        
        request("https://developers.zomato.com/api/v2.1/categories", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON(completionHandler: {(response) in
            
            guard let data = response.data else {
                return
            }
            
            do {
                let jsonArray = try JSON(data: data)
                
                var categories = [CategoriesModel]()
                
                
                var j = 0
                while j < jsonArray["categories"].count {
                    
                    if let categoryId = jsonArray["categories"][j]["categories"]["id"].int, let categoryName = jsonArray["categories"][j]["categories"]["name"].string {
                        categories.append(CategoriesModel.init(id: categoryId, name: categoryName))
                    }
                    
                    j = j + 1
                }
  
                CategoriesModel.saveCategoriesToDatabase(categories: categories)
                return
            }
            catch let jsonError {
                print(jsonError.localizedDescription)
                return
                
            }
        })
        
    }
}
