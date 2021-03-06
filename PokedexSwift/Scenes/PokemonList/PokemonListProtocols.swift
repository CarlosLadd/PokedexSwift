//
//  PokemonListProtocols.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

protocol PokemonListViewModelProtocol {
    
    var pokemonsCells: [PokemonListCellViewModelProtocol] { get }
    
    var pokemonListViewState: Bindable<PagingViewState<DLPokemon>> { get }
    
    func getPokemonList()
    
}

protocol PokemonListCoordinatorProtocol: class {
    
    func showPokemonDetail(for name: String)
    
}

protocol PokemonListNavigationDelegate: class {
    
    var parentCoordinator: Coordinator? { get set }
    
}
