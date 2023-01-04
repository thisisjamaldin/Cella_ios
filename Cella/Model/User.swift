import Foundation
import RealmSwift

class User : Object{
//        @Exclude
    @Persisted(primaryKey: true) var serverId: String
    @Persisted var name: String = ""
    @Persisted var phone: String = ""
    @Persisted var employees = List<String>()
    @Persisted var accesses = List<Access>()
    @Persisted var seal: String = ""
//        @ServerTimestamp
    @Persisted var paid: Date? = nil
    @Persisted var annuallyPlan: Bool = false
    @Persisted var open: Bool = true
//        @Exclude
    @Persisted var payment: Payment = Payment()
}
