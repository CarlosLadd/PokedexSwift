//
//  SplashViewController.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

class SplashViewController: UIViewController, Storyboarded {
    
    static var storyboardName: String = "Main"
    
    var viewModel: SplashViewModelProtocol?
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupBindables()
        viewModel?.startInitialDownloads()
    }
    
    // MARK: - Reactive Behaviour
    
    private func setupBindables() {
        viewModel?.initialDownloadsEnded = { [weak self] in
            guard let strongSelf = self else { return }
            
            let navigationHandler: NavigationHandlerProtocol = DIContainer.shared.resolve()
            navigationHandler.initialTransition(from: strongSelf.view.window)
        }
    }
    
}
