//
//  NLPokemon.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

public struct NLPokemon: Decodable {
    
    public let name: String?
    public let url: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case name, url
    }
    
    // MARK: - Initializers
    
    init(name: String,
         url: String) {
        self.name = name
        self.url = url
    }
    
}

// MARK: - Domain Convertible

extension NLPokemon: DomainConvertible {
    
    func asDomain() -> DLPokemon {
        return DLPokemon(name: self.name ?? "",
                         url: self.url ?? "")
    }
    
}
