//
//  Collection+Testable.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
public extension Collection where Self: Testable, Element: Equatable {
    
    ///
    @discardableResult
    func assertContains (_ element: Element) throws -> Self {
        if !self.contains(element) {
            throw ErrorMessage("Collection does not contain \(element).")
        }
        return self
    }
}
