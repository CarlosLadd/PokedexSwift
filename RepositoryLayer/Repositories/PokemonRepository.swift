//
//  PokemonRepository.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

public class PokemonRepository: PokemonUseCaseProtocol {
    
    private var remoteDataSource: PokemonRemoteDataSourceProtocol
    
    init(remoteDataSource: PokemonRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getPokemonListAt(page: Int, completion: @escaping (Result<[DLPokemon], Error>) -> Void) {
        remoteDataSource.getPokemonListAt(page: page, completion: completion)
    }
    
}
