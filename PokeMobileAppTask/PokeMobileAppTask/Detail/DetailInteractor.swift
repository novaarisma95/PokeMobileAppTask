//
//  DetailInteractor.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation
import Alamofire

class DetailInteractor: DetailInteractorInputProtocol {
    weak var presenter: DetailInteractorOutputProtocol?
    
    func fetchPokemonDetail(url: String) {
        AF.request(url)
            .validate()
            .responseDecodable(of: PokemonDetail.self) { response in
                switch response.result {
                case .success(let detail):
                    self.presenter?.didFetchPokemonDetail(detail)
                case .failure(let error):
                    self.presenter?.didFailFetchingPokemonDetail(error.localizedDescription)
                }
            }
    }
}
