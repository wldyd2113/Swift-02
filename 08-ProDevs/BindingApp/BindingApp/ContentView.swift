//
//  ContentView.swift
//  BindingApp
//
//  Created by 차지용 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""

    var body: some View {
        VStack {
            Text("Hello, \(message)")
            HStack {
                Text("Send a greeting:")
                TextField("Type a message here", text: $message)
                DisplayTextField(newVariable: $message)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


