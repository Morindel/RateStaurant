//
//  ForgotPasswordViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 22/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordViewController : BaseViewController {
    
    //MARK:Properties
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK:Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNavigationBar()
        
        setupTextField()
        
    }
    
    func setupTextField() {
        emailTextField.addBottomBorder()
    }
    
    //MARK:Actions
}
