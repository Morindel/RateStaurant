//
//  BaseViewController.swift
//  RateStaurant
//
//  Created by Jakub Kołodziej on 19/06/2019.
//  Copyright © 2019 Jakub Kołodziej. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class BaseViewController : UIViewController {
    
    //MARK:Properties
    
    var loadingView : UIView?
    var managedContext: NSManagedObjectContext!
    
    //MARK:Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeBorderLineFromNavigationBar()
        
        registerNotificationForKeyboard()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterNotificationForKeyboard()
    }
    
    
    //MARK:Actions
    
    func presentViewController (name:String?, onViewController viewController:UIViewController?) {
        
        guard let name = name, let viewController = viewController else {
            return
        }
        
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewControllerToBePresented = storyboard.instantiateViewController(withIdentifier: name)
        
        viewController.present(viewControllerToBePresented, animated: true, completion: nil)
    }
    
    
    //MARK: Keyboard
    func registerNotificationForKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterNotificationForKeyboard() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/3
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    
    //MARK: Navigation Bar
    
    func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
    
    func removeBorderLineFromNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func showBorderLineNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for:.default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func setNavigationBarTitle(title: String) {
        self.navigationController?.navigationBar.backItem?.title = title
    }
    
    //MARK: Loading View
    
    func showLoadingView(onView : UIView) {
        let loadingView = UIView.init(frame: onView.bounds)
        loadingView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = loadingView.center
        
        DispatchQueue.main.async {
            loadingView.addSubview(ai)
            onView.addSubview(loadingView)
        }
        
        self.loadingView = loadingView
    }
    
    func removeLoadingView() {
        DispatchQueue.main.async {
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
}
