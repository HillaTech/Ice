//
//  UIColor.swift
//  Thunder
//
//  Created by Mahdi on 1/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: - Inital
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue:      CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    
    //MARK: - Custom Color
    
    static var PRIMARY_1 : UIColor { return UIColor(named: "PRIMARY_1")! }
    static var PRIMARY_2 : UIColor { return UIColor(named: "PRIMARY_2")! }
    static var PRIMARY_3 : UIColor { return UIColor(named: "PRIMARY_3")! }
    static var PRIMARY_4 : UIColor { return UIColor(named: "PRIMARY_4")! }
//    static var PRIMARY_5 : UIColor { return UIColor(named: "PRIMARY_5")! }
//    static var PRIMARY_6 : UIColor { return UIColor(named: "PRIMARY_6")! }
//    static var PRIMARY_7 : UIColor { return UIColor(named: "PRIMARY_7")! }
//    static var PRIMARY_8 : UIColor { return UIColor(named: "PRIMARY_8")! }
//    static var PRIMARY_9 : UIColor { return UIColor(named: "PRIMARY_9")! }
    
//    static var PRIMARY_RED  : UIColor { return UIColor(hexString: "#DF571B") }
//    static var PRIMARY_BLACK : UIColor { return UIColor(hexString: "#282A2B") }
    
}
