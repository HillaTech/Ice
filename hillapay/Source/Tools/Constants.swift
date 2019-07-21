//
//  Constants.swift
//  Thunder
//
//  Created by Mahdi on 1/2/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation

struct Constants {
    
    struct tapBar {
        
        static let item1 = "Home"
        static let item2 = "Explorer"
        static let item3 = ""
        static let item4 = "firstUserLatt"
        static let item5 = "firstUserLong"
    }
    
    struct nib {
        
        static let EventTableCell               = "EventsTableViewCell"
        static let EventCollectionCell          = "EventCollectionViewCell"
        static let ProfileBioTableCell          = "ProfileBioTableViewCell"
        static let ProfileWorkoutTableCell      = "ProfileWorkoutTableViewCell"
        static let ProfileWorkoutCollectionCell = "ProfileWorkoutCollectionViewCell"
        
    }
    
    struct cell {
        
        static let EventsCell          = "EventsCell"
        static let EventCell           = "EventCell"
        static let ProfileBioCell      = "ProfileBioCell"
        static let ProfileWorkoutCell  = "ProfileWorkoutCell"
        static let ProfileWorkoutCCell = "ProfileWorkoutCCell"
        
    }
    
    struct font {
        
        static let IRANSansRegular = "IRANSansMobileFaNum"
        static let IRANSansMedium  = "IRANSansMobileFaNum-Medium"
        static let IRANSansBold    = "IRANSansMobileFaNum-Bold"
        static let IRANSansLight   = "IRANSansMobileFaNum-Light"
        
    }

    
    //MARK: - API NESTED
    
    struct API {
        
        static let BASE             = "https://api.hillapay.ir/app/v1"
        static let LONGMORE         = "&cid=D754d01f66aae2a4&uid=15252&source=3&debug=0"
        
        static let device_Register  = BASE + "/log?action=client" + LONGMORE
        static let user_signin      = BASE + "/user?action=sign" + LONGMORE
        static let user_token       = BASE + "/user?action=token" + LONGMORE
        
        static let scoring_report   = BASE + "/scoring/report?action=check" + LONGMORE
        static let report_report   = BASE + "/scoring/report?action=payment" + LONGMORE
        static let report_full     = BASE + "/scoring/report?action=full" + LONGMORE
        static let report_list     = BASE + "/scoring/report?action=list" + LONGMORE
        
        
    }
}
