//
//  ProfileViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/6/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var cellphoneTextField : UITextField!
    @IBOutlet weak var nikeNameTextField  : UITextField!
    @IBOutlet weak var firstNameTextField : UITextField!
    @IBOutlet weak var lastNameTextField  : UITextField!
    @IBOutlet weak var codeMeliTextField  : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.navigationItem.title = Strings.profile
    }

    @IBAction func editeAction(_ sender: Any) {
        
    }
}
