//
//  ViewController.swift
//  LoginApp
//
//  Created by Masaie on 8/3/22.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {

    //MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let user = User.getUser()

    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        
        for viewController in tabBarController.children {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.dataModel = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let aboutMeVC = navigationVC.topViewController as? AboutUserViewController else { return }
                aboutMeVC.dataModel = user
            }
        }
    }
    
    //MARK: - Method prepare with switch
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let tabBarController = segue.destination as? UITabBarController else { return }
//        guard let viewControllers = tabBarController.viewControllers else { return }
//
//        for viewController in viewControllers {
//            var childVC: UIViewController?
//
//            if let navigationVC = viewController as? UINavigationController {
//                childVC = navigationVC.topViewController
//            } else {
//                childVC = viewController
//            }
//
//            switch childVC {
//            case let viewController as WelcomeViewController:
//                viewController.dataModel = user
//            case let viewController as AboutUserViewController:
//                viewController.dataModel = user
//            default:
//                break
//            }
//        }
//    }
    
    //MARK: - IBActions
    @IBAction func logInButtonPressed() {
        guard userNameTextField.text == user.user, passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func showAuthorizationData(_ sender: UIButton) {
        sender.tag == 0
        ?showAlert(title: "Oops!", message: "Your name is \(user.user)😉")
        :showAlert(title: "Oops!", message: "Your password is \(user.password)😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - Alerts Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - Keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
        }
        return true
    }
}
