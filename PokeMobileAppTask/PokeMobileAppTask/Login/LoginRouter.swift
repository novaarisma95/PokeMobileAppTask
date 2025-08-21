//
//  LoginRouter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class LoginRouter: PresenterToRouterLoginProtocol {
    static func createModule() -> UIViewController {
        let view = LoginViewController(nibName: "LoginViewController", bundle: nil)
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        let interactor: PresenterToInteractorLoginProtocol = LoginInteractor()
        let router: PresenterToRouterLoginProtocol = LoginRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
    
    func navigateToRegistrationScreen(from view: UIViewController) {
        let registrationVC = RegistrationRouter.createModule()
        view.navigationController?.pushViewController(registrationVC, animated: true)
    }
    
    func navigateToHomeScreen(from view: UIViewController) {
        let homeVC = HomeRouter.createModule()
        view.navigationController?.pushViewController(homeVC, animated: true)
    }
}
