//
//  NearbyRestaurantsViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 03/07/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import UIKit

class NearbyRestaurantsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        RestauratsNetworkManager.getNearbyRestaurant { (isSucces) in
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
