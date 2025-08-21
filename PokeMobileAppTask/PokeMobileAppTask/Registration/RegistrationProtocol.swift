//
//  RegistrationProtocol.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

// MARK: - View -> Presenter
protocol ViewToPresenterRegisProtocol: AnyObject {
    var view: PresenterToViewRegisProtocol? { get set }
    var interactor: PresenterToInteractorRegisProtocol? { get set }
    var router: PresenterToRouterRegisProtocol? { get set }
    
    func signUpBtnTapped(username: String, fullname: String, email: String, password: String)
    func backToLogin()
}

// MARK: - Presenter -> View
protocol PresenterToViewRegisProtocol: AnyObject {
    func showRegisSuccess(message: String)
    func showRegisFailure(error: String)
}

// MARK: - Presenter -> Interactor
protocol PresenterToInteractorRegisProtocol: AnyObject {
    var presenter: InteractorToPresenterRegisProtocol? { get set }
    
    func regis(username: String, fullname: String, email: String, password: String)
}

// MARK: - Interactor -> Presenter
protocol InteractorToPresenterRegisProtocol: AnyObject {
    func regisSucceeded(user: UserRegistration)
    func regisFailed(error: String)
}

// MARK: - Presenter -> Router
protocol PresenterToRouterRegisProtocol: AnyObject {
    static func createModule() -> UIViewController
    func backToPreviouseScreen(from view: UIViewController)
}

