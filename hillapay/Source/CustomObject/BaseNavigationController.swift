//
//  BaseNavigationController.swift
//  Thunder
//
//  Created by Mahdi on 1/2/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        print("BaseNavigationController")
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constants.font.IRANSansRegular, size: 17)!, .foregroundColor: UIColor.white]
        
        self.navigationBar.barStyle      = .blackTranslucent
        self.navigationBar.barTintColor  = UIColor.PRIMARY_4
        self.navigationBar.tintColor     = UIColor.white
        self.navigationBar.isTranslucent = false
        self.navigationBar.shadowImage   = UIImage()
        
        
    }
    
}

