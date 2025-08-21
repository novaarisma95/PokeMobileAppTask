//
//  HomeInteractor.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation
import Alamofire

class HomeInteractor: HomeInteractorInputProtocol {
    weak var presenter: HomeInteractorOutputProtocol?
    
    func fetchPokemons(limit: Int, offset: Int) {
        let url = "https://pokeapi.co/api/v2/pokemon"
        let params: Parameters = ["limit": limit, "offset": offset]
        
        AF.request(url, parameters: params)
            .validate()
            .responseDecodable(of: PokemonListResponse.self) { response in
                switch response.result {
                case .success(let result):
                    self.presenter?.didFetchPokemons(result.results)
                case .failure(let error):
                    self.presenter?.didFailFetchingPokemons(error.localizedDescription)
                }
            }
    }
}
