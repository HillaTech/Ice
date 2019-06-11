//
//  SupportViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/6/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Strings.support
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBarController?.selectedIndex = 3
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
