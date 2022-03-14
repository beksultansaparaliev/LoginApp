//
//  UserViewController.swift
//  LoginApp
//
//  Created by Masaie on 12/3/22.
//

import UIKit

class AboutUserViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        workLabel.text = user.person.work
        aboutMeLabel.text = user.person.aboutMe
        
        title = user.person.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.user = user
    }
}
