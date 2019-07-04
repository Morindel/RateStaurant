//
//  SignUpViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 22/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController : BaseViewController {
    
    //MARK:Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //MARK:Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNavigationBar()
        
        setupTextFields()
        
    }
    
    //MARK:Appearance
    
    func setupTextFields() {
        emailTextField.addBottomBorder()
        passwordTextField.addBottomBorder()
        confirmPasswordTextField.addBottomBorder()
    }
    
    //MARK:Actions
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if passwordTextField.text != confirmPasswordTextField.text {
            RateAlertView.showBasicAlert(on: self, with: "Error", message: "Passwords do not match")
            return
        }
        
        guard let email = emailTextField.text, let password = passwordTextField.text else{
            return
        }
        
        showLoadingView(onView: self.view)
        
        EnrollNetworkManager.signUpUser(email: email, password: password) { (error, state) in
            if let error = error {
                RateAlertView.showBasicAlert(on: self, with: "Sign up error", message: error.localizedDescription)
                return
            }
            
            if state == .failure {
                RateAlertView.showBasicAlert(on: self, with: "Sign up error", message: "Error occurred")
            }
            
            
            RateAlertView.showAlertWithReturnToRootControllerOnCompletion(on: self, with: "Sign up successful", message: "Sign up completed, you can log in now", completion: { [weak self] in
                self?.removeLoadingView()
            })
            
            
        }
    }
    
    
}
