//
//  DLPokemon.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

public struct DLPokemon: Equatable {
    
    public let name: String?
    public let url: String?
    public var imageURL: String?
    
    // MARK: - Initializers
    
    init(name: String,
         url: String) {
        self.name = name
        self.url = url
    }
    
}
