//
//  Entity.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/21/25.
//

import Foundation

struct User {
    let email: String
    let password: String
}

struct UserRegistration {
    let username: String
    let fullname: String
    let email: String
    let password: String
}

struct PokemonListResponse: Codable {
    let results: [NamedAPIResource]
}

struct NamedAPIResource: Codable {
    let name: String
    let url: String
}

struct PokemonDetail: Codable {
    let name: String
    let abilities: [PokemonAbility]
}

struct PokemonAbility: Codable {
    let ability: NamedAPIResource
}
