//
//  UINavigationController.swift
//  Thunder
//
//  Created by Mahdi on 1/11/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import  UIKit

extension UINavigationController {
    
    func activeTranslucentStyle() {
        
        self.navigationBar.barStyle = .blackTranslucent
        self.navigationBar.isTranslucent = true
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.backgroundColor = .clear
        //UIApplication.shared.statusBarView?.backgroundColor = .clear
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
    }
    
}
