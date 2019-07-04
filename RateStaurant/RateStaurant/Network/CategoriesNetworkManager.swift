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
                    
          
                    for (_,value) in jsonArray["categories"]{
                        if let categoryId = value["categories"]["id"].int, let categoryName = value["categories"]["name"].string {
                            CategoryLocalRepository.insertCategoryToDatabase(withCategoryId: categoryId, andCategoryName: categoryName) }
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
