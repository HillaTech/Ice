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
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.report_report, parameters: parameters, completion: {
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
    func peymentGet(orderId: String,delegate: AccountHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "order_id" : "912887464144"
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.report_full, parameters: parameters, completion: {
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
    
    func getRankingList(delegate: AccountHandlerDelegate) {
        
        let parameters : [String: Any] = [
            "order_id" : "912887464144"
        ]
        
        ApiHandler.shared.sendPostRequest(url: Constants.API.report_list, parameters: parameters, completion: {
            (response: NSDictionary, status: Bool) in
            
            print(response)
            if status {
                
                if let result = response["result_report_list"] as? NSDictionary {
                    
                    if let listData = result["data"] as? [[String: Any]] {
                        var ranks = [Rank]()
                        for data in listData {
                            ranks.append(Rank(JSON: data)!)
                        }
                        delegate.getRankingListSuccessfully(ranks: ranks)
                    } else {
                        delegate.getRankingListFailed()
                    }
                } else {
                    delegate.getRankingListFailed()
                }
            } else {
                delegate.getRankingListFailed()
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
    
    func getRankingListSuccessfully(ranks: [Rank])
    func getRankingListFailed()
}

extension AccountHandlerDelegate {
    
    func checkReportsSuccessfully(requestId: String, priceTotal: Int){}
    func checkReportsFailed(){}
    
    func peymentReportsSuccessfully(webUrl: String){}
    func peymentReportsFailed(){}
    
    func getRankingListSuccessfully(ranks: [Rank]){}
    func getRankingListFailed(){}
}
