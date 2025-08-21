//
//  RegistrationViewController.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var presenter: ViewToPresenterRegisProtocol?
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fieldStackView: UIStackView!
    @IBOutlet weak var usernameTexfield: UITextField!
    @IBOutlet weak var fullnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var createPassword: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        signUpButton.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    private func initialSetup() {
        titleLabel.text = "Form Registration"
        usernameTexfield.placeholder = "Username"
        fullnameTextfield.placeholder = "Full Name"
        emailTextfield.placeholder = "Exp: novaarisma95@gmail.com"
        createPassword.placeholder = "Password"
    }
    
    @objc private func signUpBtnTapped() {
        presenter?.signUpBtnTapped(username: usernameTexfield.text ?? "",
                                   fullname: fullnameTextfield.text ?? "",
                                   email: emailTextfield.text ?? "",
                                   password: createPassword.text ?? "")
    }
    
}


extension RegistrationViewController: PresenterToViewRegisProtocol {
    func showRegisSuccess(message: String) {
        showAlert(title: "Berhasil", message: message) {
            self.presenter?.backToLogin()
        }
    }
    
    func showRegisFailure(error: String) {
        
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        })
        present(alert, animated: true)
    }
}
