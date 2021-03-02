//
//  PokemonProvider.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

enum PokemonProvider {
    
    case getAllPokemonAt(page: Int)
    
}

// MARK: - Endpoint

extension PokemonProvider: Endpoint {
    
    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }
    
    var path: String {
        switch self {
        case .getAllPokemonAt:
            return "/api/v2/pokemon"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var params: [String: Any]? {
        switch self {
        case .getAllPokemonAt(let page):
            return [
                "offset": page,
                "limit": 20
            ]
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        return .defaultEncoding
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}
