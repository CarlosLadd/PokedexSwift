//
//  PokemonListProtocols.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

protocol PokemonListViewModelProtocol {
    
    var pokemonsList: Bindable<[DLPokemon]> { get }
    
    var pokemonsCells: [PokemonListCellViewModelProtocol] { get }
    
    func getPokemonList()
    
}

protocol PokemonListCoordinatorProtocol: class {
    
    func showPokemonDetail(for name: String)
    
}

protocol PokemonListNavigationDelegate: class {
    
    var parentCoordinator: Coordinator? { get set }
    
}
