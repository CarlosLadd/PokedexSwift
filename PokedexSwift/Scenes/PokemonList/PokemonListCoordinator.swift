//
//  PokemonListCoordinator.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

final class PokemonListCoordinator: NSObject, PokemonListCoordinatorProtocol, RootCoordinator, PokemonListNavigationDelegate {
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var navigationDelegate: PokemonListNavigationDelegate!
    
    // MARK: - Coordinator

    var rootIdentifier: String {
        return "pokemons"
    }
    
    // MARK: - Initializers

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = PokemonListViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        viewController.coordinator = self
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showPokemonDetail(for pokemon: DLPokemon) {
        let viewController = PokemonDetailViewController()
        viewController.viewModel = DIContainer.shared.resolve()
        viewController.pokemonSelected = pokemon
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
