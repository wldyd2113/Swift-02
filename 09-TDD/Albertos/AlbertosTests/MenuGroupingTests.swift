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
        // 메뉴아이템이 동일한 카테고리를 같는 경우 하난의 섹션으로 구분
        let menu = [
            MenuItem(category: "pastas", name: "a pasta"),
            MenuItem(category: "drinks", name: "a drink"),
            MenuItem(category: "pastas", name: "another pasta"),
            MenuItem(category: "desserts", name: "a dessert"),
        ]
        let sections = groupMenuByCategory(menu)
        XCTAssertEqual(sections.count, 3)
    }
    
    func testEmptyMenuReturnEmptySection() {
        let menu = [MenuItem]()
        let sections = groupMenuByCategory(menu)
        XCTAssertTrue(sections.isEmpty)
    }
}


