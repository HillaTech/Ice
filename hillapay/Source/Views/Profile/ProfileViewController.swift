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
    
    let userHandler = UserHandler.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        self.navigationItem.title = Strings.profile
        
        
        cellphoneTextField.text = userHandler.cellPhone ?? nil
        codeMeliTextField.text  = userHandler.meliCode ?? nil
        nikeNameTextField.text  = userHandler.nikeName ?? nil
        firstNameTextField.text = userHandler.firstName ?? nil
        lastNameTextField.text  = userHandler.lastName ?? nil
        
    }

    @IBAction func editeAction(_ sender: Any) {
        
        userHandler.cellPhone = cellphoneTextField.text
        userHandler.meliCode  = codeMeliTextField.text
        userHandler.nikeName  = nikeNameTextField.text
        userHandler.firstName = firstNameTextField.text
        userHandler.lastName  = lastNameTextField.text
    }
}
