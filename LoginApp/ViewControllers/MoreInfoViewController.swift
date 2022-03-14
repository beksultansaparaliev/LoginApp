//
//  MoreInfoViewController.swift
//  LoginApp
//
//  Created by Masaie on 13/3/22.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.makeRounded()
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: user.person.photo)
    }
}

//MARK: - Set image
extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
}
