//
//  AppDelegate.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit
import Kingfisher

@available(iOS 13.0, *)
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationHandler: NavigationHandlerProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Limit of cache image
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 100 * 1024
        KingfisherManager.shared.cache.memoryStorage.config.countLimit = 100
        
        navigationHandler = DIContainer.shared.resolve()
        window?.rootViewController = SplashBuilder.buildViewController()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Code
    }


}

