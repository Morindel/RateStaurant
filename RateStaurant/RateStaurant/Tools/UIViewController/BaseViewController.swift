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
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.navigationController?.navigationBar.tintColor = UIColor.greenColor
    }

}

//MARK: Navigation Bar

extension BaseViewController {
    
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
    
}

//MARK: Loading View

extension BaseViewController {
    
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
