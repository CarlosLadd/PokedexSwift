//
//  PokemonClient.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation

class PokemonClient: APIClient, PokemonClientProtocol {
    
    let session: URLSession
    
    // MARK: - Initializers
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        self.init(configuration: configuration)
    }
    
    // MARK: - Pokemon List
    
    func getAllPokemonListAt(page: Int,
                             completion: @escaping (Result<PokemonResult?, APIError>) -> Void) {
        let request = PokemonProvider.getAllPokemonAt(page: page).request
        
        fetch(with: request, decode: { json -> PokemonResult? in
            guard let pokemonResult = json as? PokemonResult else { return nil }
            return pokemonResult
        }, completion: completion)
    }
    
}
