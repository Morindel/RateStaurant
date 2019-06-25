//
//  CoreDataManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 25/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    

    static let sharedManager = CoreDataManager()

    private init() {}
    

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "RateStaurant")
        
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    

    func saveContext () {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
          
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
