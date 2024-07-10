//
//  AlbertosTests.swift
//  AlbertosTests
//
//  Created by 차지용 on 7/10/24.
//

import XCTest
@testable import Albertos


final class MenuGroupingTests: XCTestCase {
    func testMenuWithManyCategoriesReturnsOneSectionPerCategory() {
        
    }
    
    func testMenuWithOneCategoryReturnOneSection() {
        
    }
    
    func testEmptyMenuReturnEmptySection() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty)
    }
}


