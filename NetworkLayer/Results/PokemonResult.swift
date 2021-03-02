//
//  PokemonResult.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

struct PokemonResult: Decodable {
    
    let count: Int
    let results: [NLPokemon]
    
    private enum CodingKeys: String, CodingKey {
        case count, results
    }
    
}
