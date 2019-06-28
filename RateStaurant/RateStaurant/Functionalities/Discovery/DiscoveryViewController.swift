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

enum DiscoveryViewControllerSections : Int {
    case titleSection
    case categoriesSection
    case numberOfSections
}

class DiscoveryViewController: BaseViewController {
   
    //MARK:Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var whiteHeaderView: UIView!
    
    
    var fetchedResultController : NSFetchedResultsController<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        downloadData()
    }
    
  
    
    func registerCells() {
            collectionView.register(UINib(nibName: "DiscoveryTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DiscoveryTitleCollectionViewCell")
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
        
        if section == DiscoveryViewControllerSections.titleSection.rawValue {
            return 1
        }
        
        if let count = fetchedResultController?.fetchedObjects?.count {
            return count
        }
        
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DiscoveryViewControllerSections.numberOfSections.rawValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == DiscoveryViewControllerSections.titleSection.rawValue {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoveryTitleCollectionViewCell", for: indexPath) as? DiscoveryTitleCollectionViewCell
            return cell ?? UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoveryCollectionViewCell", for: indexPath) as? DiscoveryCollectionViewCell
        
        let indexPathForFetchedController = IndexPath(row: indexPath.row, section: 0)
        cell?.loadWithCategory(category: fetchedResultController?.object(at: indexPathForFetchedController))
        
        return cell ?? UICollectionViewCell()
    }
    
}

extension DiscoveryViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == DiscoveryViewControllerSections.titleSection.rawValue {
            return CGSize(width: Constants.deviceScreenWidth, height: 80)
        } else {
            return CGSize(width: 166, height: 166)
        }
    }
    
}

//stretching white view under status bar when scrolling
extension DiscoveryViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y < 0) {
             whiteHeaderView.frame = CGRect(x: 0, y: collectionView.frame.origin.y, width: Constants.deviceScreenWidth, height: abs(scrollView.contentOffset.y))
        }
    }
    
}
