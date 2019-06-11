//
//  ChildViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/11/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainImageView.image = image
    }

}
