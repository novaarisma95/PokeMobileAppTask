//
//  DetailPresenter.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var router: DetailRouterProtocol?
    
    private let pokemon: NamedAPIResource
    
    init(pokemon: NamedAPIResource) {
        self.pokemon = pokemon
    }
    
    func viewDidLoad() {
        interactor?.fetchPokemonDetail(url: pokemon.url)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func didFetchPokemonDetail(_ detail: PokemonDetail) {
        view?.showPokemonDetail(detail)
    }
    
    func didFailFetchingPokemonDetail(_ error: String) {
        view?.showError(error)
    }
}
