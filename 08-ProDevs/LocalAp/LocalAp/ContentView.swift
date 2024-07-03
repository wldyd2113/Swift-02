//
//  ContentView.swift
//  LocalAp
//
//  Created by 차지용 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeColor = false
    var body: some View {
        VStack {
            Text(LocalizedStringKey("greeting-label"))
            Text("greeting-label")
            Button("button-label") {
                changeColor.toggle()
            }
        }
        .background(changeColor ? Color.red : Color.yellow)
        .padding()
    }
}

#Preview("기본 - 한국어") {
    ContentView()
}

#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("French") {
    ContentView()
        .environment(\.locale, .init(identifier: "fr"))
}

#Preview("Spanish") {
    ContentView()
        .environment(\.locale, .init(identifier: "es"))
}
