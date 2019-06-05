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
        
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationBar.barTintColor = UIColor.PRIMARY_1
        self.navigationBar.isTranslucent = false
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Constants.font.IRANSansRegular, size: 16)!]
        self.navigationBar.tintColor = .red
        
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        
    }
    
}

