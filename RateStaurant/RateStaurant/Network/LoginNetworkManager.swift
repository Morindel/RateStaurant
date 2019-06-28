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
    
    static func signInUser( email:String, password:String, callback: @escaping (Error?, BoolenResponse) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                callback(error, .failure)
                return
            }
            
            callback(nil, .success)
            
        }
    }
    
    static func signUpUser(email:String, password:String, callback: @escaping (Error?, BoolenResponse) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil {
                callback(error, .failure)
                return
            }
            
            callback(nil, .success)
            
        }
    }
    
    static func resetPassword(email:String, callback: @escaping (Error?, BoolenResponse) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                callback(error, .failure)
                return
            }
            
            callback(nil, .success)
            
        }
    }
    
}
