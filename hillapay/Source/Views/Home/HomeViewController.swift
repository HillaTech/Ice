//
//  HomeViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/6/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Strings.home
    }

    @IBAction func chackAccountAction(_ sender: Any) {
        
        let vc = RankingListViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

