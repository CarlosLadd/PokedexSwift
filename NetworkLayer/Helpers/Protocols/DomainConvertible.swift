//
//  DomainConvertible.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

protocol DomainConvertible {
    
    associatedtype Domain
    
    func asDomain() -> Domain
    
}
