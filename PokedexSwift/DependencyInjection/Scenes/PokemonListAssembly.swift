//
//  PokemonListAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation
import Swinject

final class PokemonListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PokemonListInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(UseCasesProviderProtocol.self)
            return PokemonListInteractor(useCaseProvider: useCaseProvider!)
        }
        
        container.register(PokemonListViewModelProtocol.self) { resolver in
            let interactor = resolver.resolve(PokemonListInteractorProtocol.self)
            return PokemonListViewModel(interactor: interactor!)
        }
    }
    
}
