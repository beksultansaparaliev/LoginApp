//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by Masaie on 13/3/22.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        imageView.makeRounded()
    }
}

//MARK: - Set image
extension UIImageView {
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
