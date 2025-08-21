//
//  HomeViewController.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol?
    private var pokemons: [NamedAPIResource] = []
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokemons"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter?.viewDidLoad()
    }
    
    func showPokemons(_ pokemons: [NamedAPIResource]) {
        self.pokemons = pokemons
        self.isLoading = false
        tableView.reloadData()
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = pokemons[indexPath.row].name.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPokemon(pokemons[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let height = scrollView.contentSize.height - scrollView.frame.size.height
        if position > height - 100, !isLoading {
            isLoading = true
            presenter?.loadMorePokemons(offset: pokemons.count)
        }
    }
}
