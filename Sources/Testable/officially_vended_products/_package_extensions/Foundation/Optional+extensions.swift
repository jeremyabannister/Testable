//
//  Optional+Testable.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
public extension Optional {
    
    ///
    @discardableResult
    func assertNil () throws -> Self {
        if let notNil = self {
            throw ErrorMessage("Not nil: \(notNil).")
        }
        return self
    }
    
    ///
    @discardableResult
    func assertNotNil () throws -> Wrapped {
        if let wrapped = self {
            return wrapped
        } else {
            throw ErrorMessage("Optional<\(Wrapped.self)> was nil.")
        }
    }
}
