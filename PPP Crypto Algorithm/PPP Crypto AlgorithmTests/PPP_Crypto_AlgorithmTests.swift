//
//  PPP_Crypto_AlgorithmTests.swift
//  PPP Crypto AlgorithmTests
//
//  Created by Ricardo Hernández González on 30/01/20.
//  Copyright © 2020 unam. All rights reserved.
//

import XCTest
@testable import PPP_Crypto_Algorithm

class PPP_Crypto_AlgorithmTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let _ = SecurityWithCryptoKit.shared.generateSequenceKey()
        let result = PasswordsCreator.shared.getPassword(characterSet: "abykaek", passcodeLength: 3)
        debugPrint(result)
        debugPrint(PasswordsCreator.shared.counter)
//        XCTAssertNotNil(result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
