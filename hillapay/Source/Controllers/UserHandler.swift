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
    
    func deviceRegister(delegate: UserHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "locale"            : "en-US",
            "user_agent"        : "ios",
            "application_ver"   : "1.0.0",
            "application_name"  : "hillapay"
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
                response[""]
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
