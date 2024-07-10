//
//  MenuItem.swift
//  Albertos
//
//  Created by 차지용 on 7/10/24.
//

import Foundation

struct MenuItem {
    let category: String
    let name: String
}

func groupMenuByCategory(_ menu: [MenuItem]) -> [MenuSection] {
    if menu.isEmpty { return [] }
    return Dictionary(grouping: menu, by: { $0.category} )
        .map { key, value in MenuSection(category: key, items: value)}
        .sorted { $0.category > $1.category }
}
