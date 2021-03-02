//
//  PokemonListCollectionViewCellProtocol.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

protocol PokemonListCollectionViewCellProtocol {
    
    var pokemonImage: UIImageView! { get set }
    var viewModel: PokemonListCellViewModelProtocol? { get set }
    
}
