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
    var retry: Int = 0
    
    func login(email: String, password: String) {
        if email == "codeid@gmail.com" && password == "123456" {
            let user = User(email: email, password: password)
            presenter?.loginSucceeded(user: user)
            retry = 0
        } else {
            retry += 1
            if retry < 3 {
                presenter?.loginFailed(error: "Email atau password salah")
            } else if retry > 3 {
                presenter?.loginFailed(error: "Ayo registrasi dulu")
            }
        }
    }
}
