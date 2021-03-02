//
//  NetworkConfiguration.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

final class NetworkConfiguration {

    static let shared = NetworkConfiguration()

    var baseAPIURLString: String {
        return "https://pokeapi.co/api/v2"
    }
    
    var pokemonLocalArray: [DLPokemon] = [DLPokemon]()

    init() {}

    func configure() {
        // Code
    }

}
