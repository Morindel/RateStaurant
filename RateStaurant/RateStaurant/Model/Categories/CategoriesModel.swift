//
//  CategoriesModel.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 23/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CategoriesModel : Codable {
    let id: Int
    let name: String
    
    init(id:Int, name:String) {
        self.id = id
        self.name = name
    }
    
}

extension CategoriesModel {
    
    static func saveCategoriesToDatabase(categories:[CategoriesModel]) {
        
       let context = CoreDataManager.sharedManager.persistentContainer.viewContext

        for category in categories {
            let newCategory = NSEntityDescription.insertNewObject(forEntityName: "Category", into: context)
            newCategory.setValue(category.id, forKey: "id")
            newCategory.setValue(category.name, forKey: "name")
        }
        
        CoreDataManager.sharedManager.saveContext()
    
    }
    
    static func fetchAllCategories() -> NSFetchedResultsController<Category>?{
        
        let request = NSFetchRequest<Category>(entityName: "Category")
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
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
