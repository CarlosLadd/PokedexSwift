//
//  PokemonListCellViewModel.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation

protocol PokemonListCellViewModelProtocol {
    
    var imageURL: URL? { get }
    
}

final class PokemonListCellViewModel: PokemonListCellViewModelProtocol {
    
    let imageURL: URL?
    
    init(_ pokemon: DLPokemon) {
        imageURL = URL(string: pokemon.imageURL ?? "")
    }
    
}
