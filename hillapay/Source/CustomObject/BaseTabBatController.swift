//
//  MainTabBarController.swift
//  Adventurer
//
//  Created by Mahdi on 5/18/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//


import Foundation
import UIKit

class BaseTabBatController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
//        let firstTabNavigationController   = BaseNavigationController.init(rootViewController   : HomeViewController())
//        let secondTabNavigationControoller = BaseNavigationController.init(rootViewController : ExplorerViewController())
//        let thirdTabNavigationController   = BaseNavigationController.init(rootViewController   : ProfileViewController())
//
//        self.viewControllers = [firstTabNavigationController, secondTabNavigationControoller, thirdTabNavigationController]
//        
//        let item1Title = NSLocalizedString(Constants.String.home     , comment: "")
//        let item2Title = NSLocalizedString(Constants.String.explorer , comment: "")
//        let item3Title = NSLocalizedString(Constants.String.profile  , comment: "")
//
//        
//        let item1 = UITabBarItem(title: item1Title, image: UIImage(named: "ic_tab1"), tag: 0)
//        let item2 = UITabBarItem(title: item2Title, image: UIImage(named: "ic_tab2"), tag: 1)
//        let item3 = UITabBarItem(title: item3Title, image: UIImage(named: "ic_tab3"), tag: 2)
//        
//        firstTabNavigationController.tabBarItem   = item1
//        secondTabNavigationControoller.tabBarItem = item2
//        thirdTabNavigationController.tabBarItem   = item3
//        
//        self.tabBar.barTintColor = UIColor.PRIMARY_4
//        self.tabBar.isTranslucent = true
//        
//        UITabBar.appearance().tintColor = UIColor.PRIMARY_1
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: FontHandler.getRegular(size: 11)], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: FontHandler.getMedium(size: 11)], for: .selected)
//        
    }
    
}
