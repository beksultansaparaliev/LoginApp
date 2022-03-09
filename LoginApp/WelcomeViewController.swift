//
//  WelcomeScreenViewController.swift
//  LoginApp
//
//  Created by Masaie on 8/3/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
    }
    
    @IBAction func logOut() {
        dismiss(animated: true)
    }
}
