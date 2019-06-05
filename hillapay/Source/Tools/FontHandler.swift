//
//  FontHandler.swift
//  Thunder
//
//  Created by Mahdi on 1/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

class FontHandler: NSObject {
    
    static func getRegular(size:CGFloat) -> UIFont {
        if let font = UIFont(name: Constants.font.IRANSansRegular, size: size) {
            return font
        }
        return UIFont()
    }
    
    static func getMedium(size:CGFloat) -> UIFont {
        if let font = UIFont(name: Constants.font.IRANSansMedium, size: size) {
            return font
        }
        return UIFont()
    }
    
    static func getBold(size:CGFloat) -> UIFont {
        if let font = UIFont(name: Constants.font.IRANSansBold, size: size) {
            return font
        }
        return UIFont()
    }
    
    static func getLight(size:CGFloat) -> UIFont {
        if let font = UIFont(name: Constants.font.IRANSansLight, size: size) {
            return font
        }
        return UIFont()
    }
    
    
}
