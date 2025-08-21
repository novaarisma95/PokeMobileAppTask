//
//  DetailRouter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    static func createModule(pokemon: NamedAPIResource) -> UIViewController {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter(pokemon: pokemon)
        let interactor: DetailInteractorInputProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
