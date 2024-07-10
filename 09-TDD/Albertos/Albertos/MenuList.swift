//
//  ContentView.swift
//  Albertos
//
//  Created by 차지용 on 7/10/24.
//

import SwiftUI

struct MenuList: View {
    let sections: [MenuSection]

    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.category)) {
                    ForEach(section.items) { item in
                        Text(item.name)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuList(sections: groupMenuByCategory(menu))
}
