//
//  Date.swift
//  hillapay
//
//  Created by Mahdi on 7/17/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import Foundation

extension Date {
    
    static func hillDate(date: String) -> Date {
        
        //        print(date)
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        //        //dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00") //Current time zone
        //        //according to date format your date string
        //        guard let date2 = dateFormatter.date(from: date) else {
        //            fatalError()
        //        }
        //
        
        //let isoDate = "2016-04-14T10:44:00+0000"
        
        var isoDate = date
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "UTC") // set locale to reliable US_POSIX
        guard let date2 = dateFormatter.date(from:isoDate) else {
            return Date()
        }
        
        print("SandoghDate => \(isoDate) || \(date2)")
        
        return date2
        
    }
    
    var Jalali: String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.locale = Locale(identifier: "fa_IR")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: self)
        
        return dateString
    }
}
