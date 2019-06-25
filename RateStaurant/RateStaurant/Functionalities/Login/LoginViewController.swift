//
//  LoginViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LoginViewController : BaseViewController {
    
    //MARK:Properties
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var signInToContinueLabel: UILabel!
    @IBOutlet weak var newToLabel: UILabel!
    
    @IBOutlet weak var emailTextFieldLabel: UITextField!
    @IBOutlet weak var passwordTextFieldLabel: UITextField!
    
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var fetchedResultController : NSFetchedResultsController<Category>?
    
//    var categories = []
    //MARK:Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextfield()
        
        hideNavigationBar()
        
    }
    
    //MARK:Appearance
    
    func setupTextfield() {
        self.emailTextFieldLabel.addBottomBorder()
        self.passwordTextFieldLabel.addBottomBorder()
    }
    
    
    
    //MARK:Button Actions
    
    @IBAction func forgotPasswordButtonClicked(_ sender: Any) {
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        guard let email = emailTextFieldLabel.text, let password = passwordTextFieldLabel.text else {
            return
        }
        
        EnrollNetworkManager.signInUser(email: email, password: password) { (error) in
            if let error = error {
                RateAlertView.showBasicAlert(on: self, with: "Login error", message: error.localizedDescription)
                return
            }
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Discovery") as! DiscoveryViewController
            self.present(vc, animated: true, completion: nil)
//            print("Nice")
        }
        
        let storyboard = UIStoryboard(name: "Discovery", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Discovery") as! DiscoveryViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
    }
    
    
    
    
    
}
