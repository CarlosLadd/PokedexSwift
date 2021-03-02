//
//  PokemonRemoteDataSource.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

final class PokemonRemoteDataSource: PokemonRemoteDataSourceProtocol {
    
    private let client: PokemonClientProtocol
    
    // MARK: - Initializers
    
    init(client: PokemonClientProtocol) {
        self.client = client
    }
    
    func getPokemonListAt(page: Int, completion: @escaping (Result<[DLPokemon], Error>) -> Void) {
        client.getAllPokemonListAt(page: page, completion: { result in
            switch result {
            case .success(let pokemonResult):
                guard let pokeResult = pokemonResult else { return }
                let pokemons = pokeResult.results.map { $0.asDomain() }
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
}
