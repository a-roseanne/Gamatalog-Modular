//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 12/12/21.
//

import Foundation

public struct GameDomainModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let released: String
    public let backgroundImage: String
    public let rating: Double
    public var favorite: Bool = false
    
    public init(id: Int, name: String, released: String, backgroundImage: String, rating: Double) {
        self.id = id
        self.name = name
        self.released = released
        self.backgroundImage = backgroundImage
        self.rating = rating
    }
}

public struct GameDomainDetailModel: Equatable, Identifiable {
    public let id: Int
    public let description: String
    
    public init(id: Int, description: String) {
        self.id = id
        self.description = description
    }
}

public struct GameDomainScreenshotModel: Equatable, Identifiable {
    public let id: Int
    public let imgUrl: String
    
    public init(id: Int, imgUrl: String) {
        self.id = id
        self.imgUrl = imgUrl
    }
}
