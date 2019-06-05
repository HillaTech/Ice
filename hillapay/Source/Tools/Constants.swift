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
        
        static let BASE             = "http://api.adventure.modarre.si"
        
        static let Verifications    = BASE + "/verifications.json"
        static let Token            = BASE + "/token"
        
        
        
    }
}
