//
//  MainTabBarBuilder.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

final class MainTabBarBuilder {
    
    class func buildViewCoordinators() -> [RootCoordinator] {
        let pokemonListNavigationController = createNavigationController(title: "Pokemons",
                                                                         image: #imageLiteral(resourceName: "pokeball_icon"))
        let pokemonCoordinator = PokemonListCoordinator(navigationController: pokemonListNavigationController)
        pokemonCoordinator.start()
        
        return [
            pokemonCoordinator
        ]
    }
    
    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
    
}
