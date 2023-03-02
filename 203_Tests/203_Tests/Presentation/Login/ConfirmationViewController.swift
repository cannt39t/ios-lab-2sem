//
//  ConfirmationViewController.swift
//  202_ServiceLayer
//
//  Created by Илья Казначеев on 02.03.2023.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var presenter: ConfirmationPrenster!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction private func confirmSignIn() {
        presenter.confirm()
    }
}
