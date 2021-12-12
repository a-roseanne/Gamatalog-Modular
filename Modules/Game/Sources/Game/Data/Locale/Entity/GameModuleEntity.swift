
import Foundation
import RealmSwift

public class GameModuleEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String? = ""
    @objc dynamic var backgroundImage: String? = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var favorite = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class GameDetEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var desc: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 12/12/21.
//

import Foundation
