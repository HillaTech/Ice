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
    
    
    func loginStep1(cellphone: String,delegate: UserHandlerDelegate) {
        
    }
    
    func loginStep2(code: String,delegate: UserHandlerDelegate) {
        
        
    }
    
}

//MARK: - DELEGATE USER HANDLER
protocol UserHandlerDelegate {
    
    func loginStep1Successfully()
    func loginStep1Failed()
    
    func loginStep2Successfully()
    func loginStep2Failed()
}


extension UserHandlerDelegate {
    
    func loginStep1Successfully(){}
    func loginStep1Failed(){}
    
    func loginStep2Successfully(){}
    func loginStep2Failed(){}
}
