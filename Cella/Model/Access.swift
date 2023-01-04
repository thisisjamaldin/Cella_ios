import Foundation
import RealmSwift

class Access : Object{
    @Persisted var warehouseId: String = ""
    @Persisted var ownerId: String = ""
    @Persisted var add: Bool = false
    @Persisted var sell: Bool = false
    @Persisted var edit: Bool = false
    @Persisted var seeCostPrice: Bool = false
    @Persisted var seeSellingPrice: Bool = false
    @Persisted var seeQuantity: Bool = false
    @Persisted var analyze: Bool = false
//        @Exclude
    var name: String = ""
    
        func allAccessGiven() -> Bool {
            return add && sell && edit && seeCostPrice && seeSellingPrice && seeQuantity && analyze
        }

        func anyAccess() -> Bool {
            return add || sell || edit || seeCostPrice || seeSellingPrice || seeQuantity || analyze
        }

//        func withFullAccess() -> Access {
//            return Access(warehouseId: "", ownerId: "",
//                add = true,
//                sell = true,
//                edit = true,
//                seeCostPrice = true,
//                seeSellingPrice = true,
//                seeQuantity = true,
//                analyze = true
//            )
//        }
}
