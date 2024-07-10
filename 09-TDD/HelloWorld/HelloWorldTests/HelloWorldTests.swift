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
        let year = 2020 // arrange:    입력 준비
        let leap = isLeap(year) // Act: 테스트 대상을 실행
        XCTAssertTrue(leap) // Assert: 출력 확인
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
