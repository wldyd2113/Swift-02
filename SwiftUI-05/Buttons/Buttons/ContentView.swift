//
//  ContentView.swift
//  Buttons
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 44) {
                NavigationLink("Buttons") {
                    ButtonView()
                }
                NavigationLink("EditButtonView") {
                    EditButtonView()
                }
                NavigationLink("MenuViewButtons") {
                    MenuView()
                }
                NavigationLink("Details about text") {
                    Text("Very long text that should not be deplayed in a single line because it is not good design")
                        .padding()
                        .navigationTitle(Text("Detail"))
                }
            }
            .navigationTitle(Text("Main View"))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
