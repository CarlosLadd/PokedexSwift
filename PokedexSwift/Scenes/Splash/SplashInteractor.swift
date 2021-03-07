//
//  SplashInteractor.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

struct SplashInteractor: SplashInteractorProtocol {
    
    private let pokemonUseCase: PokemonUseCaseProtocol
    
    init(useCaseProvider: UseCasesProviderProtocol) {
        self.pokemonUseCase = useCaseProvider.pokemonUseCase()
    }
    
    func getAllPokemonList(completion: @escaping (Result<[DLPokemon], Error>) -> Void) {
        // TODO: Get only the first page
        pokemonUseCase.getPokemonListAt(page: 0,
                                        completion: completion)
    }
    
}
