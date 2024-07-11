//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by 차지용 on 7/11/24.
//

import XCTest
@testable import Albertos

final class MenuRowViewModelTests: XCTestCase {
    func testWhenItemIsNotSpicyTextIsItemNameOnly() {
        let item = MenuItem.fixture(name: "name", spicy: false)
        let viewModel = MenuRow.ViewModel(item: item)
        
        // 컴파일러가 말합니다: Type 'MenuRow' has no member 'ViewModel'
        XCTAssertEqual(viewModel.text, "name")
    }
    func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji () {}

}
