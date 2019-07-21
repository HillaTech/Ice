//
//  MainTabBarController.swift
//  Adventurer
//
//  Created by Mahdi on 5/18/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//


import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        
        let firstTabNavigationController   = BaseNavigationController.init(rootViewController   : SupportViewController())
        let secondTabNavigationControoller = BaseNavigationController.init(rootViewController : ProfileViewController())
        let thirdTabNavigationController   = BaseNavigationController.init(rootViewController   : ReportsViewController())
        let forceTabNavigationController   = BaseNavigationController.init(rootViewController   : HomeViewController())

        self.viewControllers = [firstTabNavigationController, secondTabNavigationControoller, thirdTabNavigationController, forceTabNavigationController]
        
        let item1Title = NSLocalizedString(Strings.support  , comment: "")
        let item2Title = NSLocalizedString(Strings.profile  , comment: "")
        let item3Title = NSLocalizedString(Strings.messages , comment: "")
        let item4Title = NSLocalizedString(Strings.home     , comment: "")

        
        let item1 = UITabBarItem(title: item1Title, image: UIImage(named: "ic_tabbar4"), tag: 0)
        let item2 = UITabBarItem(title: item2Title, image: UIImage(named: "ic_tabbar3"), tag: 1)
        let item3 = UITabBarItem(title: item3Title, image: UIImage(named: "ic_tabbar2"), tag: 2)
        let item4 = UITabBarItem(title: item4Title, image: UIImage(named: "ic_tabbar1"), tag: 3)
        
        firstTabNavigationController.tabBarItem   = item1
        secondTabNavigationControoller.tabBarItem = item2
        thirdTabNavigationController.tabBarItem   = item3
        forceTabNavigationController.tabBarItem   = item4
        
        self.tabBar.barTintColor = UIColor.PRIMARY_2
        self.tabBar.tintColor = UIColor.PRIMARY_1
        self.tabBar.isTranslucent = true
        
        //UITabBar.appearance().tintColor = UIColor.PRIMARY_4
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: FontHandler.getRegular(size: 11)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: FontHandler.getMedium(size: 11)], for: .selected)
        
    }
    
}
