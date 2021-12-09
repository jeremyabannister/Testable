//
//  Foundation+Testable_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
fileprivate final class TestFoundationTestableConformances: XCTestCase {
    
    ///
    func test () {
        proof_Testable(Array<Double>.self)
        proof_Testable(Bool.self)
        proof_Testable(ClosedRange<Date>.self)
        proof_Testable(Data.self)
        proof_Testable(Date.self)
        proof_Testable(DateFormatter.self)
        proof_Testable(Dictionary<String, Bool>.self)
        proof_Testable(Dictionary<Bool, Int>.Keys.self)
        proof_Testable(Dictionary<String, Bool>.Values.self)
        proof_Testable(Double.self)
        proof_Testable(Int.self)
        proof_Testable(JSONDecoder.self)
        proof_Testable(JSONEncoder.self)
        proof_Testable(Optional<Bool>.self)
        proof_Testable(Result<Int, ErrorMessage>.self)
        proof_Testable(Set<String>.self)
        proof_Testable(String.self)
        proof_Testable(UInt.self)
        proof_Testable(URL.self)
        proof_Testable(URLComponents.self)
        proof_Testable(URLRequest.self)
        proof_Testable(UUID.self)
    }
}
