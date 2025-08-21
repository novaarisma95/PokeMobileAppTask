//
//  DetailViewController.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemon Detail"
        presenter?.viewDidLoad()
    }
    
    func showPokemonDetail(_ detail: PokemonDetail) {
        nameLabel.text = detail.name.capitalized
        let abilities = detail.abilities.map { $0.ability.name }.joined(separator: ", ")
        abilitiesLabel.text = "Abilities: \(abilities)"
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
