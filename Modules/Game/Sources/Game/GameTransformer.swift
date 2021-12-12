//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 12/12/21.
//

import Core
 
public struct GameTransformer: Mapper {
    public typealias Response = [GameResponse]
    public typealias Entity = [GameModuleEntity]
    public typealias Domain = [GameDomainModel]
    
    public init() {}
    
    public func transformResponseToEntity(response: [GameResponse]) -> [GameModuleEntity] {
        return response.map { result in
            let newGame = GameModuleEntity()
            newGame.id = result.id
            newGame.name = result.name
            newGame.released = result.released ?? "No Released Date"
            newGame.backgroundImage = result.backgroundImage ?? ""
            newGame.rating = result.rating ?? 0.0
            return newGame
        }
    }
    
    public func transformEntityToDomain(entity: [GameModuleEntity]) -> [GameDomainModel] {
        return entity.map { result in
            return GameDomainModel(
                id: result.id,
                name: result.name,
                released: result.released ?? "No Released Date",
                backgroundImage: result.backgroundImage ?? "",
                rating: result.rating
            )
        }
    }
}
