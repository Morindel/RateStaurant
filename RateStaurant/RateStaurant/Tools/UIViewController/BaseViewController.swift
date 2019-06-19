//
//  BaseViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    
    //MARK:Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:Appearance
    
    func hideNavigationBar() {
     navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationVar() {
         navigationController?.isNavigationBarHidden = false
    }
    

}
