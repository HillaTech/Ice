//
//  Rank.swift
//  hillapay
//
//  Created by Mahdi on 7/17/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import Foundation
import ObjectMapper

class Rank: NSObject, Mappable {
    
    var request_id      : String?
    var mobile          : String?
    var national_code   : String?
    var perice_total    : String?
    var url             : String?
    var url_pdf         : String?
    var status          : String?
    var timestamp       : String?
    var amount          : String?
    var order_id        : String?
    
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        request_id      <- map["request_id"]
        mobile          <- map["mobile"]
        national_code   <- map["national_code"]
        perice_total    <- map["perice_total"]
        url             <- map["url"]
        url_pdf         <- map["url_pdf"]
        status          <- map["status"]
        timestamp       <- map["timestamp"]
        amount          <- map["amount"]
        order_id        <- map["order_id"]
        
    }
    
}


