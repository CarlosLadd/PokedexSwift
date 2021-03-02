//
//  SplashProtocols.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation

protocol SplashViewModelProtocol {
    
    var initialDownloadsEnded: (() -> Void)? { get set }
    func startInitialDownloads()
    
}

protocol SplashInteractorProtocol {
    
    func getAllPokemonList(completion: @escaping (Result<[DLPokemon], Error>) -> Void)
    
}
