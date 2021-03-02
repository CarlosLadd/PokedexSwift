//
//  PokemonRemoteDataSourceProtocol.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

public protocol PokemonRemoteDataSourceProtocol {
    
    func getPokemonListAt(page: Int,
                          completion: @escaping (Result<[DLPokemon], Error>) -> Void)
    
}
