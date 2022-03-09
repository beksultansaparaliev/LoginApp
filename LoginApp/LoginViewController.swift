//
//  ViewController.swift
//  LoginApp
//
//  Created by Masaie on 8/3/22.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var userNameButton: UIButton!
    
    
    private let userLogin = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.insertSublayer(setViewGradient(), at: 0)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController  else { return }
        welcomeVC.userName = "Welcome, \(userLogin)!"
        welcomeVC.view.layer.insertSublayer(setViewGradient(), at: 0)
    }
    
    @IBAction func login() {
        guard userNameTextField.text == userLogin, passwordTextField.text == password else {
            showAlerts(loginButton)
            return
        }
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return false
//    }
//
//    @IBAction func usernameTFAction() {
//        userNameTextField.returnKeyType = .next
//    }
//
//    @IBAction func passwordTFAction() {
//        passwordTextField.returnKeyType = .done
//    }
}

//MARK: - Alerts Methods

extension LoginViewController {
    @IBAction func showAlerts(_ sender: UIButton) {
        switch sender {
        case loginButton:
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                sender: sender
            )
        case passwordButton:
            showAlert(
                title: "Oops!",
                message: "Your password is Password 😎",
                sender: sender
            )
        case userNameButton:
            showAlert(
                title: "Oops!",
                message: "Your name is User 😎",
                sender: sender
            )
        default: break
        }
    }
    
    private func showAlert(title: String, message: String, sender: UIButton) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        let okActionWithHandler = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        
        switch sender {
        case loginButton, passwordButton:
            alert.addAction(okActionWithHandler)
        default:
            alert.addAction(okAction)
        }
        present(alert, animated: true)
    }
}

//MARK: - ViewGradient Methods

extension LoginViewController {
    func setViewGradient() -> CALayer {
        let firstColor = UIColor(
            red: 60 / 255,
            green: 60 / 255,
            blue: 60 / 255,
            alpha: 1.0
        ).cgColor
        let secondColor = UIColor(
            red: 0 / 255,
            green: 128 / 255,
            blue: 128 / 255,
            alpha: 1.0
        ).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [firstColor, secondColor]
        gradientLayer.startPoint = CGPoint(x: 1.1, y: 1.1)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
}
