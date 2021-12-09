//
//  Dictionary+Testable.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
public extension Dictionary where Value: Equatable {
    
    ///
    @discardableResult
    func assertValue (forKey key: Key, equals other: Value) throws -> Self {
        
        ///
        guard let value = self[key] else {
            throw ErrorMessage("No value exists for key: \(key)")
        }
        
        ///
        guard value == other else {
            throw ErrorMessage("\(value) is not equal to \(other)")
        }
        
        ///
        return self
    }
    
    ///
    @discardableResult
    func assertNoValue (forKey key: Key) throws -> Self {
        
        ///
        guard !keys.contains(key) else {
            throw ErrorMessage("Dictionary had value for key: \(key)")
        }
        
        ///
        return self
    }
}
