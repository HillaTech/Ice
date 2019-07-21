//
//  CheckReportsViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/29/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class CheckReportsViewController: UIViewController {
    
    @IBOutlet weak var cellphoneTextField : UITextField!
    @IBOutlet weak var codeMeliTextField  : UITextField!
    
    let userHandler = UserHandler.shared
    let accountHandler = AccountHandler.shared
    var token : String?
    var requestId : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = Strings.accountReporst
        
        cellphoneTextField.text = userHandler.cellPhone ?? nil
        codeMeliTextField.text  = userHandler.meliCode ?? nil
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if token != nil {
            accountHandler.peymentReports(requestId: requestId!, token: token!, delegate: self)
        }
    }
    
    private func goStep2(requestId: String, priceTotal: Int) {
        
        let viewController = CheckReportsAlertViewController()
        viewController.price                  = priceTotal
        viewController.requestId              = requestId
        viewController.delegate               = self
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle   = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func submiteAction(_ sender: Any) {
        
        let cellPhone = cellphoneTextField.text ?? ""
        let codeMeli  = codeMeliTextField.text ?? ""

        accountHandler.checkReports(cellPhone: cellPhone, codeMeli: codeMeli, delegate: self)
        
//        let vc = GetCheckReportsViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension CheckReportsViewController: AccountHandlerDelegate {
    
    func checkReportsSuccessfully(requestId: String, priceTotal: Int) {

        self.requestId = requestId
        goStep2(requestId: requestId, priceTotal: priceTotal)
        
    }
    
    func checkReportsFailed() {
        print("checkReportsFailed")
        
        let alert = UIAlertController(title: Strings.message, message: Strings.networkError, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: Strings.ok, style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func peymentReportsSuccessfully(webUrl: String) {
        print("peymentReportsSuccessfully")
        print(webUrl)
        
        guard let url = URL(string: webUrl) else { return }
        UIApplication.shared.open(url)
    }
    
    func peymentReportsFailed() {
        print("peymentReportsFailed")
    }
}
