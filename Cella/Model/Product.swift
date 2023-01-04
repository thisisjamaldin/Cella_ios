import Foundation
import RealmSwift

class Product : Object{
//    @Exclude
    @Persisted(primaryKey: true) var serverId: String = ""
    @Persisted var parentId: String = ""
    @Persisted var image: String = ""
    @Persisted var code: String = ""
    @Persisted var name: String = ""
    @Persisted var quantity: Int64 = 0
    @Persisted var quantityType: Int64 = 0
    @Persisted var ownerId: String = ""
    @Persisted var costPrice: Int64 = 0
    @Persisted var costCurrency: Int64 = 0
    @Persisted var sellingPrice: Int64 = 0
    @Persisted var sellCurrency: Int64 = 0
    @Persisted var supplier: String = ""
    @Persisted var expirationDate: Int64 = 0
    @Persisted var deliverDate: Int64 = 0
    @Persisted var deleted: Bool = false
    @Persisted var adderId: String = ""
//    @Exclude
    var addedToCard: Bool = false
//    @Exclude
    var parentName: String = ""
    @Persisted var modified: Date? = nil
}
