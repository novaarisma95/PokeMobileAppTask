//
//  HomePresenter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    private var pokemons: [NamedAPIResource] = []
    
    func viewDidLoad() {
        interactor?.fetchPokemons(limit: 10, offset: 0)
    }
    
    func loadMorePokemons(offset: Int) {
        interactor?.fetchPokemons(limit: 10, offset: offset)
    }
    
    func didSelectPokemon(_ pokemon: NamedAPIResource) {
        guard let view = view else { return }
        router?.goToDetail(from: view, pokemon: pokemon)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func didFetchPokemons(_ pokemons: [NamedAPIResource]) {
        self.pokemons.append(contentsOf: pokemons)
        view?.showPokemons(self.pokemons)
    }
    
    func didFailFetchingPokemons(_ error: String) {
        view?.showError(error)
    }
}
