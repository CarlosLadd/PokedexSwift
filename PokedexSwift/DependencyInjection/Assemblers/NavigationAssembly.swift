//
//  NavigationAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation
import Swinject

final class NavigationAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NavigationHandlerProtocol.self) { _ in
            return NavigationHandler()
        }.inObjectScope(.container)
    }
    
}
