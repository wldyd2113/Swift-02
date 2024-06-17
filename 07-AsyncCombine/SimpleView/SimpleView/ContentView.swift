//
//  ContentView.swift
//  SimpleView
//
//  Created by 차지용 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    var body: some View {
        List {
            Label("Hello, world!", systemImage: "globe")
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .font(.system(.body, design: .monospaced))
            TextField("TextField", text: $text)
            Button("Tap me") {
                self.text = "You tapped me!"
            }
        }
    }
}

#Preview {
    ContentView()
}
