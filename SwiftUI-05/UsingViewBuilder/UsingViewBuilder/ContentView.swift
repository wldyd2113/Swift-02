//
//  ContentView.swift
//  UsingViewBuilder
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BlueCircle {
                Text("some tent here")
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 40, height: 40)
            }
            BlueCircle {
                Text("Another example")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
