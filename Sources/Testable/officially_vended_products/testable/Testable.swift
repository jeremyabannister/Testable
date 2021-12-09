//
//  Testable.swift
//  
//
//  Created by Jeremy Bannister on 12/7/21.
//

// MARK: - Head -

///
public protocol Testable { }

// MARK: - Stack -

///
public extension Testable where Self: Comparable {
    
    ///
    @discardableResult
    func assertGreater (than other: Self) throws -> Self {
        
        ///
        guard self > other else {
            throw ErrorMessage("\(self) is not greater than \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assertGreaterThanOrEqual (to other: Self) throws -> Self {
        
        ///
        guard self >= other else {
            throw ErrorMessage("\(self) is not greater than or equal to \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assertLess (than other: Self) throws -> Self {
        
        ///
        guard self < other else {
            throw ErrorMessage("\(self) is not less than \(other).")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assertLessThanOrEqual (to other: Self) throws -> Self {
        
        ///
        guard self <= other else {
            throw ErrorMessage("\(self) is not less than or equal to \(other).")
        }
        
        ///
        return self
    }
}

///
public extension Optional
    where Wrapped: Testable,
          Wrapped: Comparable,
          Wrapped: AdditiveArithmetic {
    
    ///
    @discardableResult
    func assertEqual (to other: Self, toWithin tolerance: Wrapped) throws -> Self {
        switch (self, other) {
        case (nil, nil): break
        case (.some (let a), .some (let b)):
            try a.assertEqual(to: b, toWithin: tolerance)
        default:
            throw ErrorMessage("Values are not equal because one is nil and the other is not.")
        }
        return self
    }
}

///
public extension Testable {
    
    ///
    @discardableResult
    func assert
    <Value: Comparable & AdditiveArithmetic & Testable>
    (_ keyPath: KeyPath<Self, Value?>,
     equals value: Value?,
     toWithin tolerance: Value) throws
    -> Self {
        
        ///
        guard let selfValue = self[keyPath: keyPath] else {
            if let value = value {
                throw ErrorMessage("nil is not equal to \(value).")
            }
            return self
        }
        
        ///
        guard let value = value else {
            throw ErrorMessage("\(selfValue) is not equal to nil.")
        }
        
        ///
        try selfValue.assertEqual(to: value, toWithin: tolerance)
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assert
    <Value: Comparable & AdditiveArithmetic>
    (_ keyPath: KeyPath<Self, Value>,
     equals value: Value,
     toWithin tolerance: Value) throws
    -> Self {
        
        if !self[keyPath: keyPath].equals(value, toWithin: tolerance) {
            throw ErrorMessage("\(self[keyPath: keyPath]) is not equal to \(value) to within \(tolerance).")
        }
        return self
    }
}

///
public extension Testable where Self: Comparable & AdditiveArithmetic {
    
    ///
    @discardableResult
    func assertEqual (to other: Self, toWithin tolerance: Self) throws -> Self {
        
        ///
        if !self.equals(other, toWithin: tolerance) {
            throw ErrorMessage("\(self) is not equal to \(other) to within \(tolerance).")
        }
        
        ///
        return self
    }
}

///
public extension Testable where Self: Equatable {
    
    ///
    @discardableResult
    func assertNotEqual (to other: Self) throws -> Self {
        
        ///
        guard self != other else {
            throw ErrorMessage("\(self) is equal to \(other) but should not be.")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assertEqualTo (_ value: ()->Self) throws -> Self {
        try self.assertEqual(to: value())
    }
    
    ///
    @discardableResult
    func assertEqual (to other: Self) throws -> Self {
        
        ///
        guard self == other else {
            throw ErrorMessage("\(self) is not equal to \(other).")
        }
        
        ///
        return self
    }
}

///
public extension Testable {
    
    ///
    @discardableResult
    func assert <Value: Equatable> (_ keyPath: KeyPath<Self, Value>,
                                    doesNotEqual value: Value) throws -> Self {
        
        ///
        guard self[keyPath: keyPath] != value else {
            throw ErrorMessage("\(self[keyPath: keyPath]) is equal to \(value) but shouldn't be.")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assert <Value: Equatable> (_ keyPath: KeyPath<Self, Value>,
                                    equals value: Value) throws -> Self {
        
        ///
        if self[keyPath: keyPath] != value {
            throw ErrorMessage("\(self[keyPath: keyPath]) is not equal to \(value).")
        }
        
        ///
        return self
    }
}

///
public extension Testable {
    
    ///
    @discardableResult
    func assert <Value> (_ keyPath: KeyPath<Self, Value>,
                         satisfies predicate: @escaping (Value)throws->Bool) throws
        -> Self {
        
        ///
        XCTAssertTrue(
            try predicate(self[keyPath: keyPath])
        )
        
        ///
        guard try predicate(self[keyPath: keyPath]) else {
            throw ErrorMessage("\(self[keyPath: keyPath]) failed to satisfy the predicate.")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assert (condition: @escaping (Self)throws->Bool) throws -> Self {
        
        ///
        guard try condition(self) else {
            throw ErrorMessage("\(self) failed to satisfy condition.")
        }
        
        ///
        return self
    }
}
