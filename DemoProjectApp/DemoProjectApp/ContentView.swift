//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct MyVStack <Content: View>: View { //Contet제네릭에서 View라는 프로토콜을 사용
    let content: () -> Content //content라는 속성을 선언하여 클로저 사용
    
    init(@ViewBuilder content: @escaping() -> Content) { //content클로저 매개변수 불러옴 @escaping으로 나중에 Content호출
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
            Label("Welcome to SwiftUI", systemImage: "tortoise")
        }
    }
}

#Preview {
    ContentView()
}
