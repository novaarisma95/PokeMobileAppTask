//
//  LoginInteractor.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class LoginInteractor: PresenterToInteractorLoginProtocol {
    weak var presenter: InteractorToPresenterLoginProtocol?
    
    func login(email: String, password: String) {
        // Dummy login validation
        if email == "codeid@gmail.com" && password == "123456" {
            let user = User(email: email, password: password)
            presenter?.loginSucceeded(user: user)
        } else {
            presenter?.loginFailed(error: "Email atau password salah")
        }
    }
}
