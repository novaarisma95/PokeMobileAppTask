//
//  RegistrationRouter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class RegistrationRouter: PresenterToRouterRegisProtocol {
    static func createModule() -> UIViewController {
        let view = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        let presenter: ViewToPresenterRegisProtocol & InteractorToPresenterRegisProtocol = RegistrationPresenter()
        let interactor: PresenterToInteractorRegisProtocol = RegistrationInteractor()
        let router: PresenterToRouterRegisProtocol = RegistrationRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return view
    }
    
    func backToPreviouseScreen(from view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }
}
