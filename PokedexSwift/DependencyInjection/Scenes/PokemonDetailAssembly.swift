//
//  PokemonDetailAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/7/21.
//

import Foundation
import Swinject

final class PokemonDetailAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PokemonDetailViewModelProtocol.self) { resolver in
            return PokemonDetailViewModel()
        }
    }
    
}
