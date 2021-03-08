//
//  ScenesAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation
import Swinject

final class ScenesAssembly: Assembly {
    
    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SplashAssembly(),
            PokemonListAssembly(),
            PokemonDetailAssembly()
        ]
        
        assemblies.forEach { $0.assemble(container: container) }
    }
    
}
