//
//  Bool+Testable.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
public extension Testable where Self == Bool {
    
    ///
    @discardableResult
    func assertTrue () throws -> Self {
        if !self {
            throw ErrorMessage("Was `false`.")
        }
        return self
    }
    
    ///
    @discardableResult
    func assertFalse () throws -> Self {
        if self {
            throw ErrorMessage("Was `true`.")
        }
        return self
    }
}
