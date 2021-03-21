//
//  SceneDelegate.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit
import Kingfisher

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationHandler: NavigationHandlerProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Limit of cache image
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 100 * 1024
        KingfisherManager.shared.cache.memoryStorage.config.countLimit = 100
        
        navigationHandler = DIContainer.shared.resolve()
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = SplashBuilder.buildViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }

}

