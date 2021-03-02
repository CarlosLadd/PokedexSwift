//
//  SplashBuilder.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

final class SplashBuilder {
    
    class func buildViewController() -> UIViewController {
        let viewController = SplashViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]
        
        return tabBarController
        
    }
    
}
