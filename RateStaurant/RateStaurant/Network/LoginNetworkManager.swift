//
//  LoginNetworkManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import Firebase

class LoginNetworkManager {
    
    static func signInUser( email:String, password:String, callback: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                callback(error)
                return
            }
            
        }
    }
}
