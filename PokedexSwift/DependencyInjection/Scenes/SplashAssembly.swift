//
//  SplashAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation
import Swinject

final class SplashAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(SplashInteractorProtocol.self) { resolver in
            let useCaseProvider = resolver.resolve(UseCasesProviderProtocol.self)
            return SplashInteractor(useCaseProvider: useCaseProvider!)
        }
        
        container.register(SplashViewModelProtocol.self) { resolver in
            let interactor = resolver.resolve(SplashInteractorProtocol.self)
            return SplashViewModel(interactor: interactor!)
        }
    }
    
}
