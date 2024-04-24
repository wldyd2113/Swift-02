//
//  ContentView.swift
//  LazyStacks
//
//  Created by 차지용 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(1...100000, id: \.self) { item in
                        ListRow(id: item, type: "Horizontal")
                    }
                }
            }
            .frame(height: 100, alignment: .center)
        }
    }
}

#Preview {
    ContentView()
}
