//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            .font(.largeTitle)
            .padding(16)
            HStack(alignment: .bottom) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack (alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
            }
        }
    }
}


#Preview {
    ContentView()
}
