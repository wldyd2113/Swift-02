//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct MyVStack <Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping() -> Content) {
        self.content = content
    }
    var body: some View {
        VStack(spacing:10){
            content()
        }
        .font(.largeTitle)
    }
}

struct ContentView: View {
    var body: some View {
        MyVStack {
            Text("Text Item 1")
            Text("Text Item 2")
            Text("Text Item 3")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        }
    }
}

#Preview {
    ContentView()
}
