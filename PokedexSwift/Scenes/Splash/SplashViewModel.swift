//
//  SplashViewModel.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation

final class SplashViewModel: SplashViewModelProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: SplashInteractorProtocol
    
    // MARK: - Properties
    
    private var dispatchGroup: DispatchGroup!
    var initialDownloadsEnded: (() -> Void)?
    
    // MARK: - Initializers
    
    init(interactor: SplashInteractorProtocol) {
        self.interactor = interactor
    }
    
    // MARK: - SplashViewModelProtocol
    
    func startInitialDownloads() {
        self.dispatchGroup = DispatchGroup()
        DispatchQueue.global(qos: .userInitiated).async {
            self.getInitialPokemon()
            
            self.dispatchGroup.wait()
            DispatchQueue.main.async {
                self.initialDownloadsEnded?()
            }
        }
    }
    
    // MARK: - Private
    
    /**
     * Fetch initial page pokemon list
     */
    private func getInitialPokemon() {
        dispatchGroup.enter()
        
        interactor.getAllPokemonList { [weak self] result in
            
            _ = result.map { NetworkConfiguration.shared.pokemonLocalArray.append(contentsOf: $0) }
            var newResult = [DLPokemon]()
            var counter: Int = 1
            
            for var pokemon in NetworkConfiguration.shared.pokemonLocalArray {
                pokemon.imageURL = String(format: "https://pokeres.bastionbot.org/images/pokemon/%d.png", counter)
                newResult.append(pokemon)
                counter += 1
            }
            
            NetworkConfiguration.shared.pokemonLocalArray = newResult
            self?.dispatchGroup.leave()
        }
        
    }
    
}
