//
//  ContentView.swift
//  ReadWrite
//
//  Created by 차지용 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var createText = ""
    @State var displayText = ""
    var body: some View {
        VStack {
            TextEditor(text: $createText)
            HStack {
                Button(action: {}) {
                    Text("Write File")
                }
                Button(action: {}) {
                    Text("Read File")
                }
            }
            .padding()
            TextEditor(text: $displayText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
