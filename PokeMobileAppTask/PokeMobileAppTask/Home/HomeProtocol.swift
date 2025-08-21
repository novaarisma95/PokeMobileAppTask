//
//  HomeProtocol.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func showPokemons(_ pokemons: [NamedAPIResource])
    func showError(_ message: String)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
    func loadMorePokemons(offset: Int)
    func didSelectPokemon(_ pokemon: NamedAPIResource)
}

protocol HomeInteractorInputProtocol: AnyObject {
    var presenter: HomeInteractorOutputProtocol? { get set }
    func fetchPokemons(limit: Int, offset: Int)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func didFetchPokemons(_ pokemons: [NamedAPIResource])
    func didFailFetchingPokemons(_ error: String)
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func goToDetail(from view: HomeViewProtocol, pokemon: NamedAPIResource)
}
