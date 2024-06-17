//
//  ContentView.swift
//  ListView
//
//  Created by 차지용 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("Hello, world")
            Text("Hello, Swift")
        }
        .listStyle(.plain)
    }
}

#Preview {
    ContentView()
}
