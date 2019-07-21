//
//  RankingSuccessfullyViewController.swift
//  hillapay
//
//  Created by Mahdi on 7/21/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class RankingSuccessfullyViewController: UIViewController {
    
    let userHandler = UserHandler.shared
    let accountHandler = AccountHandler.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        accountHandler.peymentGet(orderId: "", delegate: self)
    }


}

extension  GetCheckReportsViewController: AccountHandlerDelegate {
    
    
}
