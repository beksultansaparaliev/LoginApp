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
    
    var dataModel: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = dataModel.person.name
        surnameLabel.text = dataModel.person.surname
        workLabel.text = dataModel.person.work
        aboutMeLabel.text = dataModel.person.aboutMe
        
        self.title = "\(dataModel.person.name) \(dataModel.person.surname)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.imageName = dataModel.person.photo
    }
}
