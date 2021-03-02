//
//  Descriptable.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

protocol Descriptable {
    
    var description: String { get }
    
}

protocol ErrorDescriptable: Descriptable {}
