//
//  XCTestCase+conformanceProofs.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension XCTestCase {
    
    ///
    func proof_Testable <T: Testable> (_ t: T.Type) { }
    
    ///
    func proof_Testable <T: Testable> (_ t: T) { }
}
