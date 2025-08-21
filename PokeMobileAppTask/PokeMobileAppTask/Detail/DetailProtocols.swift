//
//  DetailProtocols.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    func showPokemonDetail(_ detail: PokemonDetail)
    func showError(_ message: String)
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol DetailInteractorInputProtocol: AnyObject {
    var presenter: DetailInteractorOutputProtocol? { get set }
    func fetchPokemonDetail(url: String)
}

protocol DetailInteractorOutputProtocol: AnyObject {
    func didFetchPokemonDetail(_ detail: PokemonDetail)
    func didFailFetchingPokemonDetail(_ error: String)
}

protocol DetailRouterProtocol: AnyObject {
    static func createModule(pokemon: NamedAPIResource) -> UIViewController
}
