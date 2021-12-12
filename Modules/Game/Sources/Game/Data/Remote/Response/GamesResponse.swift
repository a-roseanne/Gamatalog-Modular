//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 12/12/21.
//

import Foundation

public struct GamesResponse: Decodable {
    var results: [GameResponse]
}

public struct GameResponse: Decodable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    
    private enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
