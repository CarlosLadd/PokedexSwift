//
//  NavigationHandler.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

protocol NavigationHandlerProtocol {
    
    func initialTransition(from window: UIWindow?)
    
}

final class NavigationHandler: NavigationHandlerProtocol {
    
    private var currentSelectedIndex: Int = 0
    private var rootCoordinators: [RootCoordinator]!
    
    // MARK: - Initializers

    init() {
        rootCoordinators = MainTabBarBuilder.buildViewCoordinators()
    }
    
    // MARK: - NavigationHandlerProtocol
    
    func initialTransition(from window: UIWindow?) {
        guard let window = window else { return }
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: [UIView.AnimationOptions.curveEaseOut,
                                    UIView.AnimationOptions.transitionCrossDissolve],
                          animations: {},
                          completion: { _ in
                            let mainTabBarController = MainTabBarController(coordinators: self.rootCoordinators)
                            mainTabBarController.setSelectedIndex(self.currentSelectedIndex)
                            window.rootViewController = mainTabBarController
        })
    }
    
    // MARK: - Private

    private func changeTabBarToSelectedIndex(_ rootIdentifier: String, from window: UIWindow?) {
        let selectedIndex = index(for: rootIdentifier)
        currentSelectedIndex = selectedIndex
        guard let tabBarController = window?.rootViewController as? MainTabBarController else {
            return
        }
        tabBarController.selectedIndex = selectedIndex
    }

    private func index(for rootIdentifier: String) -> Int {
        let coordinatorIdentifiers = rootCoordinators.map { $0.rootIdentifier }
        guard let indexToSelect = coordinatorIdentifiers.firstIndex(of: rootIdentifier) else {
            fatalError()
        }

        return indexToSelect
    }
    
}
