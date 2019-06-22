//
//  RateAlertView.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit

struct RateAlertView {
    
    static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    static func showAlertWithReturnToRootControllerWithCompletion (on vc: UIViewController, with title: String, message: String, completion : @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            vc.navigationController?.popToRootViewController(animated: true)
        }))
        
        DispatchQueue.main.async {
            completion()
            vc.present(alert, animated: true)
        }
    }
    
 
}
