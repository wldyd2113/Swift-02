//
//  ContentView.swift
//  UIKitToSwoftUI
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = true
    var body: some View {
        VStack {
            ActivityIndicator(animating: animate)
            
            HStack {
                Toggle(isOn: $animate) {
                    Text("Toggle Activity")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
