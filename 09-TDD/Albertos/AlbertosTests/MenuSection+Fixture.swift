//
//  MenuSection+Fixture.swift
//  AlbertosTests
//
//  Created by 차지용 on 7/11/24.
//

@testable import Albertos

extension MenuSection {
    static func fixture(category: String = "a category",
                        items: [MenuItem] = [.fixture()]
    ) -> MenuSection {
        return MenuSection(category: category, items: items)
    }
}
