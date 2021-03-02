//
//  Paginable.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

protocol Paginable {
    
    var currentPage: Int { get set }
    var totalPages: Int { get set }
    var offset: Int { get set }
    
}

extension Paginable {
    
    var hasMorePages: Bool {
        return currentPage < totalPages
    }
    
    var nextPage: Int {
        return hasMorePages ? currentPage + offset : currentPage
    }
    
}
