//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 11/12/21.
//

import Foundation
 
public protocol Mapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
}
