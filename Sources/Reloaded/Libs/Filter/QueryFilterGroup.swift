import Foundation


public struct QueryFilterGroup {
    
    public enum Operator {
        case and
        case or
    }
    
    let `operator`: Operator
    
    let filters: [QueryFilter]
    
    public static func group(_ operator: Operator = .and, _ filters: QueryFilter ...) -> QueryFilterGroup {
        return QueryFilterGroup(operator: `operator`, filters: filters)
    }
    
    public static func group(_ operator: Operator = .and, _ filters: [QueryFilter]) -> QueryFilterGroup {
        return QueryFilterGroup(operator: `operator`, filters: filters)
    }
    
}

extension QueryFilterGroup {
    
    public func asPredicate() -> NSPredicate {
        switch `operator` {
        case .and:
            return NSCompoundPredicate(andPredicateWithSubpredicates: filters.map({
                $0.asPredicate()
            }))
        case .or:
            return NSCompoundPredicate(orPredicateWithSubpredicates: filters.map({
                $0.asPredicate()
            }))
        }
    }
    
}

extension Array where Element == QueryFilterGroup {
    
    public func asPredicate() -> NSPredicate? {
        if isEmpty {
            return nil
        }
        return NSCompoundPredicate(andPredicateWithSubpredicates: map({
            $0.asPredicate()
        }))
    }
    
}
