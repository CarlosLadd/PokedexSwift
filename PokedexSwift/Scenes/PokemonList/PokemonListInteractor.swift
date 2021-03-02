//
//  PokemonListInteractor.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

protocol PokemonListInteractorProtocol {
    
    func getPokemonList(page: Int,
                        completion: @escaping (Result<[DLPokemon], Error>) -> Void)
    
}

struct PokemonListInteractor: PokemonListInteractorProtocol {
    
    private let pokemonUseCase: PokemonUseCaseProtocol
    
    init(useCaseProvider: UseCasesProviderProtocol) {
        self.pokemonUseCase = useCaseProvider.pokemonUseCase()
    }
    
    func getPokemonList(page: Int, completion: @escaping (Result<[DLPokemon], Error>) -> Void) {
        pokemonUseCase.getPokemonListAt(page: page, completion: completion)
    }
    
}
