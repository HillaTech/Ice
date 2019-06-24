//
//  LoginStep1ViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/5/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class LoginStep1ViewController: UIViewController {

    @IBOutlet weak var cellphoneTextField: UITextField!
    
    let userHandler = UserHandler.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        cellphoneTextField.text = "09354833303"
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        let cellphone = cellphoneTextField.text ?? ""
        
        if cellphone == "" {
            
        } else {
            userHandler.loginStep1(cellphone: cellphone, delegate: self)
        }
        
    }

}

//MARK: - USER HANDLER DELEGATE 
extension LoginStep1ViewController: UserHandlerDelegate {
    
    func loginStep1Successfully() {
        
        let Login = LoginStep2ViewController()
        Login.cellPhone = cellphoneTextField.text
        Login.modalTransitionStyle = .crossDissolve
        self.present(Login, animated: true, completion: nil)
    }
    
    func loginStep1Failed() {
        print("loginStep1Failed")
    }
}
