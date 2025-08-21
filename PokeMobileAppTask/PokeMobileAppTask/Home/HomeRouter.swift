//
//  HomeRouter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
        
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let router: HomeRouterProtocol = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDetail(from view: HomeViewProtocol, pokemon: NamedAPIResource) {
        guard let vc = view as? UIViewController else { return }
        let detailVC = DetailRouter.createModule(pokemon: pokemon)
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
}
