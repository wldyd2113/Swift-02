//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by 차지용 on 7/10/24.
//

import XCTest

func isLeap(_ year: Int) -> Bool {
    guard year % 400 != 0 else { return false }
    guard year % 100 != 0 else { return false }
    return year % 4 == 0
}

final class HelloWorldTests: XCTestCase {
    
    func testEvenlyDivisibleBy4IsLeap() {
        XCTAssertTrue(isLeap(2020))
    }
    func testEvenlyDivisibleBy100ISNotLeap() {
        XCTAssertTrue(isLeap(2100))
    }
    func testEvenlyDivisibleBy400isLeap() {
        XCTAssertTrue(isLeap(2000))
    }
    func testNotEvenlyDivisibleBy40r400IsNotLeap() {
        XCTAssertTrue(isLeap(2021))
    }
}
