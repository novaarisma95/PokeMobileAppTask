//
//  LoginPresenter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class LoginPresenter: ViewToPresenterLoginProtocol {
    weak var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
    
    func loginButtonTapped(email: String, password: String) {
        interactor?.login(email: email, password: password)
    }
    
    func regisButtonTapped() {
        if let vc = view as? UIViewController {
            router?.navigateToRegistrationScreen(from: vc)
        }
    }
    
    func navigateToHomeLanding() {
        if let vc = view as? UIViewController {
            router?.navigateToHomeScreen(from: vc)
        }
    }
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    func loginSucceeded(user: User) {
        view?.showLoginSuccess(message: "Selamat datang, \(user.email)!")
    }
    
    func loginFailed(error: String) {
        view?.showLoginFailure(error: error)
    }
}

