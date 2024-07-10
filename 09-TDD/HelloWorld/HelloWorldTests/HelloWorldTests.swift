//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by 차지용 on 7/10/24.
//

import XCTest

func isLeap(_ year: Int) -> Bool {
    return false
}

final class HelloWorldTests: XCTestCase {
    
    func testEvenlyDivisibleBy4IsLeap() {
        XCTAssertTrue(isLeap(2020))
    }
    func testEvenlyDivisibleBy100ISNotLeap() {}
    func testEvenlyDivisibleBy400isLeap() {}
    func testNotEvenlyDivisibleBy40r400IsNotLeap() {}
}
