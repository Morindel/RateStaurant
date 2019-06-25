//
//  DiscoveryCollectionViewCell.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 25/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import UIKit

class DiscoveryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func loadWithCategory(category:Category?) {
        
        guard let category = category else {
            return
        }
        
//        print(category)
        categoryTitle.text = category.name
        
    }

}
