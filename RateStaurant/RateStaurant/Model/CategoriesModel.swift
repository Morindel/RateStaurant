//
//  CategoriesModel.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 23/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation



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
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        for category in categories {
            let newCategory = NSEntityDescription.insertNewObject(forEntityName: "Category", into: context)
            newCategory.setValue(category.id, forKey: "id")
            newCategory.setValue(category.name, forKey: "name")
        }
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
}
