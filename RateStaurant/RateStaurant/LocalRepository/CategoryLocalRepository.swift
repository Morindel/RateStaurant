//
//  CategoryLocalRepository.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 28/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

class CategoryLocalRepository {
    
    
    //MARK:WRITE
    
    static func insertCategoryToDatabase(withCategoryId categoryId:Int, andCategoryName categoryName:String) {
        
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        let newCategory = NSEntityDescription.insertNewObject(forEntityName: "Category", into: context)
        newCategory.setValue(categoryId, forKey: "id")
        newCategory.setValue(categoryName, forKey: "name")
    
    }
    
//    static func insertRestaurantToDatabase(jsonObject:JSON) {
//         let context = CoreDataManager.sharedManager.persistentContainer.viewContext
//        
//     //   let newRestaurant =
//        
//    }
//    
    //MARK:READ
    
    static func fetchAllCategories() -> NSFetchedResultsController<Category>?{
        
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        
        let request = NSFetchRequest<Category>(entityName: "Category")
        let sort = NSSortDescriptor(key: #keyPath(Category.id), ascending: true)
        request.sortDescriptors = [sort]
        
        
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        return fetchedResultsController
    }
    
}
