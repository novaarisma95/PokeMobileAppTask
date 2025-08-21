//
//  LoginViewController.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    var presenter: ViewToPresenterLoginProtocol?
    
    @IBOutlet weak var backgroundLoginImage: UIImageView!
    @IBOutlet weak var pokeBallImage: UIImageView!
    @IBOutlet weak var welcomeTitleLabel: UILabel!
    @IBOutlet weak var loginTitleLabel: UILabel!
    @IBOutlet weak var fieldStackView: UIStackView!
    @IBOutlet weak var emailTextFieldView: UITextField!
    @IBOutlet weak var passwordTextFieldView: UITextField!
    @IBOutlet weak var bottomButtonStackView: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(regisTapped), for: .touchUpInside)
    }

    private func setupLayout() {
        emailTextFieldView.placeholder = "Email"
        passwordTextFieldView.placeholder = "Password"
        
        loginButton.setTitle("Login", for: .normal)
        registerButton.setTitle("Register", for: .normal)
        rotateBall()
    }
    
    private func rotateBall() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = CGFloat.pi * 2  // muter 360 derajat
        rotation.duration = 5.0            // semakin kecil semakin cepat
        rotation.repeatCount = .infinity   // muter terus
        rotation.isRemovedOnCompletion = false
        pokeBallImage.layer.add(rotation, forKey: "rotatePokeball")
    }
        
    @objc private func loginTapped() {
        guard let email = emailTextFieldView.text, let password = passwordTextFieldView.text else { return }
        presenter?.loginButtonTapped(email: email, password: password)
    }
    
    @objc private func regisTapped() {
        presenter?.regisButtonTapped()
    }
}

extension LoginViewController: PresenterToViewLoginProtocol {
    func showLoginSuccess(message: String) {
        showAlert(title: "Sukses", message: message) { [weak self] in
            if let presenter = self?.presenter {
                presenter.navigateToHomeLanding()
            }
        }
    }
    
    func showLoginFailure(error: String) {
        showAlert(title: "Gagal", message: error)
    }
    
    private func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            completion?()
        }))
        present(alert, animated: true)
    }
}
