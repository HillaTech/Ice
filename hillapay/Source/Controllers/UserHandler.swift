//
//  UserHandler.swift
//  hillapay
//
//  Created by Mahdi on 6/11/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import Foundation

class UserHandler {
    
    public static let shared = UserHandler()
    private init(){}
    
    let ud = UserDefaults.standard
    
    var cellPhone: String? {
        get {
            return ud.value(forKey: "UDCellPhone") as? String
        }
        set {
            ud.set(newValue, forKey: "UDCellPhone")
            ud.synchronize()
        }
    }
    
    var meliCode : String? {
        
        get {
            return ud.value(forKey: "UDMeliCode") as? String
        }
        set {
            ud.set(newValue, forKey: "UDMeliCode")
            ud.synchronize()
        }
    }
    
    var nikeName : String? {
        
        get {
            return ud.value(forKey: "UDNikeName") as? String
        }
        set {
            ud.set(newValue, forKey: "UDNikeName")
            ud.synchronize()
        }
    }
    
    var firstName : String? {
        
        get {
            return ud.value(forKey: "UDFirstName") as? String
        }
        set {
            ud.set(newValue, forKey: "UDFirstName")
            ud.synchronize()
        }
    }
    
    var lastName : String? {
        
        get {
            return ud.value(forKey: "UDLastName") as? String
        }
        set {
            ud.set(newValue, forKey: "UDLastName")
            ud.synchronize()
        }
    }
    
    var uID : String? {
        
        get {
            return ud.value(forKey: "userUID") as? String
        }
        set {
            ud.set(newValue, forKey: "userUID")
            ud.synchronize()
        }
    }

    func isLogin() -> Bool {
        
        if uID != nil {
            return true
        } else {
            return false
        }
    }
    
    func deviceRegister(delegate: UserHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "locale"            : "en-US",
            "user_agent"        : "iOS",
            "system_name"       : "iOS",
            "application_ver"   : "1.0.0",
            "application_name"  : "hillapay",
            "timezone"          : "Asia/Tehran"
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.device_Register, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            print(response)
        })
    }
    
    func loginStep1(cellphone: String,delegate: UserHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "mobile" : cellphone
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.user_signin, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            
            if status {
                delegate.loginStep1Successfully()
            } else {
                delegate.loginStep1Failed()
            }
        })
    }
    
    func loginStep2(cellphone: String, code: String,delegate: UserHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "mobile" : cellphone,
            "token"  : code
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.user_token, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            
            if status {
                
                print(response)
                if let resultUser = response["result_user_token"] as? [String: Any] {
                    if let uid = resultUser["uid"] as? String {
                        
                        self.uID = uid
                    }
                }
                
                print(response)
                delegate.loginStep2Successfully()
            } else {
                delegate.loginStep2Failed()
            }
        })
    }
    
}

//MARK: - DELEGATE USER HANDLER
protocol UserHandlerDelegate {
    
    func deviceRegisterSuccessfully()
    func deviceRegisterFailed()
    
    func loginStep1Successfully()
    func loginStep1Failed()
    
    func loginStep2Successfully()
    func loginStep2Failed()
}


extension UserHandlerDelegate {
    
    func deviceRegisterSuccessfully(){}
    func deviceRegisterFailed(){}
    
    func loginStep1Successfully(){}
    func loginStep1Failed(){}
    
    func loginStep2Successfully(){}
    func loginStep2Failed(){}
}
