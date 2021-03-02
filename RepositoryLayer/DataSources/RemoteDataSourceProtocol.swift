//
//  RemoteDataSourceProtocol.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

public protocol RemoteDataSourceProtocol {
    
    func pokemonDataSource() -> PokemonRemoteDataSourceProtocol
    
}
