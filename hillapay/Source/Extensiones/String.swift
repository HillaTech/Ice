//
//  String.swift
//  hillapay
//
//  Created by Mahdi on 7/20/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import Foundation

extension String {
    
    func priceModel() -> String {
        
        var i = 0
        var upper = ""
        var upper2 = ""
        
        for character in self {
            upper = "\(character)\(upper)"
        }
        
        for character in upper {
            if i == 3 {
                i = 0
                upper2 = "\(character),\(upper2)"
            } else {
                i += 1
                upper2 = "\(character)\(upper2)"
            }
        }
        
        return upper2
    }
}
