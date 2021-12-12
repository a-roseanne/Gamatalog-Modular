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

struct GameDetailModel: Equatable, Identifiable {
    let id: Int
    let description: String
}

struct GameScreenshotModel: Equatable, Identifiable {
    let id: Int
    let imgUrl: String
}
