//
//  CheckReportsAlertViewController.swift
//  hillapay
//
//  Created by Mahdi on 7/3/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class CheckReportsAlertViewController: UIViewController {
    
    @IBOutlet weak var descript  : UILabel!
    @IBOutlet weak var tokenTextView  : UITextField!
    var delegate : CheckReportsViewController?
    
    var price : Int!
    var requestId : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()

        let desc = Strings.priceForReports + " \(price ?? 0) " + Strings.realIs
        
        descript.text = desc
        tokenTextView.text = "1111"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.viewDidAppear(animated)
    }
    
    @IBAction func submiteAction(_ sender: Any) {
        
        delegate?.token = tokenTextView.text
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func canceleAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
