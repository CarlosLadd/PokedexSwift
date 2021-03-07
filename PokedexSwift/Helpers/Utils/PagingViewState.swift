//
//  PagingViewState.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/6/21.
//

import Foundation

enum PagingViewState<Entity>: Equatable where Entity: Equatable {
    
    case initial
    case paging([Entity], next: Int)
    case populated([Entity])
    case empty
    case error(Error)
    
    static func == (lhs: PagingViewState, rhs: PagingViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (let .paging(lhsEntities, _), let .paging(rhsEntities, _)):
            return lhsEntities == rhsEntities
        case (let .populated(lhsEntities), let .populated(rhsEntities)):
            return lhsEntities == rhsEntities
        case (.empty, .empty):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
    
    var currentEntities: [Entity] {
        switch self {
        case .populated(let entities):
            return entities
        case .paging(let entities, _):
            return entities
        case .initial, .empty, .error:
            return []
        }
    }
    
    var currentPage: Int {
        switch self {
        case .initial, .populated, .empty, .error:
            return 0
        case .paging(_, let page):
            return page
        }
    }
    
    var isInitialPage: Bool {
        return currentPage == 0
    }
    
    var needsPrefetch: Bool {
        switch self {
        case .initial, .populated, .empty, .error:
            return false
        case .paging:
            return true
        }
    }
    
}
