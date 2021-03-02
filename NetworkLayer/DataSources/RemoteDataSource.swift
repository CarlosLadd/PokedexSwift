//
//  RemoteDataSource.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

final class RemoteDataSource: RemoteDataSourceProtocol {
    
    public init() {}
    
    public func pokemonDataSource() -> PokemonRemoteDataSourceProtocol {
        let client = PokemonClient()
        return PokemonRemoteDataSource(client: client)
    }
    
}
