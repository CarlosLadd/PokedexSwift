//
//  PokemonListViewModel.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation

final class PokemonListViewModel: PokemonListViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: PokemonListInteractorProtocol
    
    
    // MARK: - Reactive Properties
    
    private (set) var pokemonsList: Bindable<[DLPokemon]> = Bindable([DLPokemon]())
    
    // MARK: - Computed Properties
    
    private var pokemons: [DLPokemon] {
        return pokemonsList.value
    }
    
    var pokemonsCells: [PokemonListCellViewModelProtocol] {
        return pokemons.compactMap { PokemonListCellViewModel($0) }
    }
    
    // MARK: - Initializers
    
    init(interactor: PokemonListInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - PokemonListViewModelProtocol
    
    func getPokemonList() {
        pokemonsList.value = NetworkConfiguration.shared.pokemonLocalArray
        
        // Pre-Fetch Scroll interaction
        /*interactor.getPokemonList(page: 0, completion: { result in
            switch result {
            case .success(let pokemonArray):
                print("Pokemon List: \(pokemonArray.count)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        })*/
    }
    
}
