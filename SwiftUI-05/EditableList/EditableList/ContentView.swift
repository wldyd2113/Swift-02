//
//  ContentView.swift
//  EditableList
//
//  Created by 차지용 on 4/24/24.
//

import SwiftUI
struct TodoItme: Identifiable {
    let id = UUID()
    var title: String
}

struct ContentView: View {
    @State private var todos = [
        TodoItme(title: "Eat"),
        TodoItme(title: "Sleep"),
        TodoItme(title: "Code"),
    ]
    var body: some View {
        List($todos) { todo in
            TextField("Todo item", text: todo.title)

        }
        
    }
}

#Preview {
    ContentView()
}
