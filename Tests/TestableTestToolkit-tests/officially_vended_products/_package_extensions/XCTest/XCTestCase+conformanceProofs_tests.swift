//
//  XCTestCase+conformanceProofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
extension XCTestCase_tests {
    
    ///
    func test_proof_Testable_metatype () {
        func imagine <T: Testable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Testable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Testable_instance () {
        func imagine <T: Testable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Testable(t)
            }
        }
    }
}
