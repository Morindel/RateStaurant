//
//  LoginNetworkManager.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import Firebase

class EnrollNetworkManager: NetworkManager {
    
    static func signInUser( email:String, password:String, callback: @escaping (Error?, Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                callback(error, false)
                return
            }
            
            callback(nil,true)
            
        }
    }
    
    static func signUpUser(email:String, password:String, callback: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                callback(nil, error)
                return
            }
            callback(result, nil)
            return
            
        }
    }
    
    static func resetPassword(email:String, callback: @escaping(Error?, Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                callback(error, false)
                return
            }
            
            callback(nil, true)
            return
        }
    }

}
