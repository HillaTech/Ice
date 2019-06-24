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
    var cellPhone : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        verifyCodeTextField.text = "110"
    }
    
    @IBAction func SubmitAction(_ sender: Any) {
        
        let verifyCode = verifyCodeTextField.text ?? ""
        
        if verifyCode == "" {
            
        } else {
            userHandler.loginStep2(cellphone: cellPhone, code: verifyCode, delegate: self)
        }
        
    }
    

}


//MARK: - USER HANDLER DELEGATE
extension LoginStep2ViewController: UserHandlerDelegate {
    
    func loginStep2Successfully() {
        
        let Login = BaseTabBarController()
        Login.modalTransitionStyle = .crossDissolve
        self.present(Login, animated: true, completion: nil)
        
    }
    
    func loginStep2Failed() {
        print("loginStep2Failed")
    }
}
