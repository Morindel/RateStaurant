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
    
    
    static func getRestaurantCategories(completion: @escaping (BoolenResponse) -> Void) {
        
        request("https://developers.zomato.com/api/v2.1/categories", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.API.headers).responseJSON(completionHandler: {(response) in
            
            switch response.result {
                
            case .success:
                do {
                    
                    guard let data = response.data else {
                        return
                    }
                    let jsonArray = try JSON(data: data)
                    
                    var j = 0
                    while j < jsonArray["categories"].count {
                        if let categoryId = jsonArray["categories"][j]["categories"]["id"].int, let categoryName = jsonArray["categories"][j]["categories"]["name"].string {
                            CategoryLocalRepository.insertCategoryToDatabase(withCategoryId: categoryId, andCategoryName: categoryName)
                        }
                        j = j + 1
                    }
                    
                    CoreDataManager.sharedManager.saveContext()
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
