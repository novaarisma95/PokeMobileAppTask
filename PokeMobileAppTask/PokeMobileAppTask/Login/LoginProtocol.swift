//
//  LoginProtocol.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

// MARK: - View -> Presenter
protocol ViewToPresenterLoginProtocol: AnyObject {
    var view: PresenterToViewLoginProtocol? { get set }
    var interactor: PresenterToInteractorLoginProtocol? { get set }
    var router: PresenterToRouterLoginProtocol? { get set }
    
    func loginButtonTapped(email: String, password: String)
    func regisButtonTapped()
    func navigateToHomeLanding()
}

// MARK: - Presenter -> View
protocol PresenterToViewLoginProtocol: AnyObject {
    func showLoginSuccess(message: String)
    func showLoginFailure(error: String)
}

// MARK: - Presenter -> Interactor
protocol PresenterToInteractorLoginProtocol: AnyObject {
    var presenter: InteractorToPresenterLoginProtocol? { get set }
    func login(email: String, password: String)
}

// MARK: - Interactor -> Presenter
protocol InteractorToPresenterLoginProtocol: AnyObject {
    func loginSucceeded(user: User)
    func loginFailed(error: String)
}

// MARK: - Presenter -> Router
protocol PresenterToRouterLoginProtocol: AnyObject {
    static func createModule() -> UIViewController
    func navigateToRegistrationScreen(from view: UIViewController)
    func navigateToHomeScreen(from view: UIViewController)
}

