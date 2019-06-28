//
//  DiscoveryViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 25/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DiscoveryViewController: BaseViewController {
    //MARK:Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fetchedResultController : NSFetchedResultsController<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        downloadData()
        

    }
    
  
    
    func registerCells() {
            collectionView.register(UINib(nibName: "DiscoveryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoveryCollectionViewCell")
    }
    
    //MARK:Data
    
    func downloadData(){
        CategoriesNetworkManager.getRestaurantCategories { [weak self] (state) in
            if state == .success {
                self?.fetchedResultController = CategoriesModel.fetchAllCategories()
                do {
                    try  self?.fetchedResultController?.performFetch()
                } catch let error {
                    print(error.localizedDescription)
                }
                
                self?.collectionView.reloadData()
            }
        }
    }
}

extension DiscoveryViewController : UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = fetchedResultController?.fetchedObjects?.count {
            return count
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoveryCollectionViewCell", for: indexPath) as? DiscoveryCollectionViewCell
        cell?.loadWithCategory(category: fetchedResultController?.object(at: indexPath))
        
        return cell ?? UICollectionViewCell()
    }

    
}
