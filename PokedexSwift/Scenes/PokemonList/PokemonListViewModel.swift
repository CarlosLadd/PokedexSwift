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
    
    private (set) var pokemonListViewState: Bindable<PagingViewState<DLPokemon>> = Bindable(.initial)
    
    // MARK: - Computed Properties
    
    private var pokemons: [DLPokemon] {
        return pokemonListViewState.value.currentEntities
    }
    
    var pokemonsCells: [PokemonListCellViewModelProtocol] {
        return pokemons.compactMap { PokemonListCellViewModel($0) }
    }
    
    var needsPrefetch: Bool {
        return pokemonListViewState.value.needsPrefetch
    }
    
    // MARK: - Initializers
    
    init(interactor: PokemonListInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - PokemonListViewModelProtocol
    
    func getPokemonList() {
        fetchPokemons(currentPage: pokemonListViewState.value.currentPage)
    }
    
    private func fetchPokemons(currentPage: Int) {
        interactor.getPokemonList(page: currentPage, completion: { result in
            switch result {
            case .success(let pokemons):
                var parsedPokemon = [DLPokemon]()
                var counter: Int = self.pokemons.count == 0 ? 1 : self.pokemons.count
                
                for var pokemon in pokemons {
                    pokemon.imageURL = String(format: "https://pokeres.bastionbot.org/images/pokemon/%d.png", counter)
                    parsedPokemon.append(pokemon)
                    counter += 1
                }
                
                self.pokemonListViewState.value = self.parsePokemonsResult(pokemons: parsedPokemon,
                                                                           currentPage: currentPage,
                                                                           currentPokemons: self.pokemons)
            case .failure(let error):
                self.pokemonListViewState.value = .error(error)
            }
        })
    }
    
    private func parsePokemonsResult(pokemons: [DLPokemon],
                                     currentPage: Int,
                                     currentPokemons: [DLPokemon]) -> PagingViewState<DLPokemon> {
        var allPokemons = (currentPage == 0 ? [] : currentPokemons)
        allPokemons.append(contentsOf: pokemons)
        
        guard !allPokemons.isEmpty else { return .empty }
        
        return pokemons.isEmpty ? .populated(allPokemons) : .paging(allPokemons, next: currentPage + 1)
    }
    
}
