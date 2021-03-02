//
//  ProviderAssembly.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import Foundation
import Swinject

final class ProviderAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UseCasesProviderProtocol.self) { resolver in
            UseCaseProvider(remoteDataSource: resolver.resolve(RemoteDataSourceProtocol.self)!)
        }
    }
    
}
