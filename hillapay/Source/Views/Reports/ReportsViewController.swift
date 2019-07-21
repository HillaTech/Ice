//
//  ReportsViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/6/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = Strings.messages

    }
    
    @IBAction func filterAction(_ sender: Any) {
        
        let filter = ReportsFilterViewController()
        filter.modalPresentationStyle = .overCurrentContext
        filter.modalTransitionStyle = .crossDissolve
        self.present(filter, animated: true, completion: nil)
    }
    
}
