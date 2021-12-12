
import Foundation
import RealmSwift

public class GameModuleEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String? = ""
    @objc dynamic var backgroundImage: String? = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var favorite = false
    
    public override static func primaryKey() -> String? {
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
