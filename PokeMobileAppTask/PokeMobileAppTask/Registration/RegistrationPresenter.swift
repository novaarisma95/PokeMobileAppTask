//
//  RegistrationPresenter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class RegistrationPresenter: ViewToPresenterRegisProtocol {

    weak var view: PresenterToViewRegisProtocol?
    var interactor: PresenterToInteractorRegisProtocol?
    var router: PresenterToRouterRegisProtocol?
    
    func signUpBtnTapped(username: String, fullname: String, email: String, password: String) {
        interactor?.regis(username: username, fullname: fullname, email: email, password: password)
    }
    
    func backToLogin() {
        router?.backToPreviouseScreen(from: view as! UIViewController)
    }
    
}

extension RegistrationPresenter: InteractorToPresenterRegisProtocol {
    func regisSucceeded(user: UserRegistration) {
        view?.showRegisSuccess(message: "Selamat datang, \(user.username)!")
    }
    
    func regisFailed(error: String) {
        view?.showRegisFailure(error: error)
    }
}
