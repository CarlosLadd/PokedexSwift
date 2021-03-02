//
//  UseCaseProvider.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

final class UseCaseProvider: UseCasesProviderProtocol {
    
    private let remoteDataSource: RemoteDataSourceProtocol
    
    // MARK: - Initializers
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func pokemonUseCase() -> PokemonUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.pokemonDataSource()
        return PokemonRepository(remoteDataSource: remoteDataSource)
    }
    
}
