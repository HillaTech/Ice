//
//  LoginStep2ViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/5/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class LoginStep2ViewController: UIViewController {
    
    @IBOutlet weak var verifyCodeTextField: UITextField!
    
    let userHandler = UserHandler.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func SubmitAction(_ sender: Any) {
        
        let verifyCode = verifyCodeTextField.text ?? ""
        
        if verifyCode == "" {
            
        } else {
            userHandler.loginStep2(code: verifyCode, delegate: self)
        }
        
    }
    

}


//MARK: - USER HANDLER DELEGATE
extension LoginStep2ViewController: UserHandlerDelegate {
    
    func loginStep2Successfully() {
        print("loginStep2Successfully")
    }
    
    func loginStep2Failed() {
        print("loginStep2Failed")
    }
}
