//
//  PokemonClientProtocol.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

protocol PokemonClientProtocol {
    
    func getAllPokemonListAt(page: Int,
                             completion: @escaping (Result<PokemonResult?, APIError>) -> Void)
    
}
