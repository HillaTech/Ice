//
//  AccountHandler.swift
//  hillapay
//
//  Created by Mahdi on 6/28/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import Foundation

class AccountHandler {
    
    public static let shared = AccountHandler()
    
    private init(){}
    
    
    func checkReports(cellPhone: String, codeMeli: String,delegate: AccountHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "national_code" : codeMeli,
            "mobile"        : cellPhone
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.scoring_report, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            
            print(response)
            if status {
                
                if let result = response["result_report_check"] as? NSDictionary {
                    
                    guard let priceTotal = result["price_total"] as? Int else {
                        return
                    }
                    
                    guard let requestId = result["request_id"] as? String else {
                        return
                    }
                    delegate.checkReportsSuccessfully(requestId: requestId, priceTotal: priceTotal)
                }
            } else {
                delegate.checkReportsFailed()
            }
        })
    }
    
    func peymentReports(requestId: String, token: String,delegate: AccountHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "request_id" : requestId,
            "token"      : token
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.payment_report, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            
            print(response)
            if status {
                
                if let result = response["result_report_get"] as? NSDictionary {
                    
                    guard let url = result["transaction_url"] as? String else {
                        return
                    }
                    
                    delegate.peymentReportsSuccessfully(webUrl: url)
                }
            } else {
                delegate.peymentReportsFailed()
            }
        })
    }
    
}

//MARK: - DELEGATE ACCOUNT HANDLER
protocol AccountHandlerDelegate {
    
    func checkReportsSuccessfully(requestId: String, priceTotal: Int)
    func checkReportsFailed()
    
    func peymentReportsSuccessfully(webUrl: String)
    func peymentReportsFailed()
}

extension AccountHandlerDelegate {
    
    func checkReportsSuccessfully(requestId: String, priceTotal: Int){}
    func checkReportsFailed(){}
    
    func peymentReportsSuccessfully(webUrl: String){}
    func peymentReportsFailed(){}
}
