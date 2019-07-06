//
//  ApiHandler.swift
//  Adventurer
//
//  Created by Mahdi on 4/27/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation
import Alamofire

class ApiHandler {
    
    public static let shared = ApiHandler()
    
    private init() {}
    
    let token = "Bearer"
    
    func sendGetRequest(url: String, parameters: [String: Any], completion: @escaping(NSDictionary, Bool) -> Void) {
        
//        let headers = ["Authorization" : token]
        let headers = [
            "Content-Type" : "application/json",
            "api-key"      : "5030"
        ]
        
        print("Send Get Request : \(url)")
        
        Alamofire.request(url, method: .get, parameters: parameters, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let Json = response.result.value as? NSDictionary {
                        print(Json)
                        if let status = Json["status"] as? Bool {
                            if status {
                                if let data = Json["data"] as? NSDictionary {
                                    completion(data, status)
                                }
                            } else {
                                if let error = Json["error"] as? NSDictionary {
                                    var errorDictionary = [String : Any]()
                                    if let message = error["message"] as? String {
                                        errorDictionary["message"] = message
                                        
                                    }
                                    if let code = error["code"] as? Int {
                                        errorDictionary["code"] = code
                                    }
                                    completion(errorDictionary as NSDictionary, status)
                                }
                            }
                        }
                    }
                case .failure( _):
                    completion([:], false)
                }
        }
    }
    
    func sendPostRequest(url: String, parameters: [String: Any], completion: @escaping(NSDictionary, Bool) -> Void) {
        
        let headers = [
            "Content-Type" : "application/json",
            "api-key"      : "5030"
        ]
        
        print("Send Post Request : \(url)")
        print("parameters : \(parameters)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success:
                    if let Json = response.result.value as? NSDictionary {
                        print(Json)
                        completion(Json, true)
                    }
                case .failure( _):
                    completion([:], false)
                }
        }
    }
    
    func sendPostJsonBodyRequest(url: String, parameters: [String: Any], completion: @escaping(NSDictionary, Bool) -> Void) {
        
        let headers = [
            "Content-Type" : "application/json",
            "api-key"      : "5030"
        ]
        
        print("Send Post Request : \(url)")
        print("parameters : \(parameters)")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                    
                case .success:
                    if let Json = response.result.value as? NSDictionary {
                        print(Json)
                        completion(Json, true)
                    }
                case .failure( _):
                    completion([:], false)
                }
        }
    }
    
}
