//
//  ContentView.swift
//  ListActions
//
//  Created by 차지용 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    @State var numbers = [1,2,3,4]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
            .navigationTitle("Number List")
            .navigationBarTitleDisplayMode(.inline)// navigationTitle안으로 넣어줌
            .toolbar {
                Button("Add") {
                    addItemToRow()
                }
            }
        }
    }
    private func addItemToRow() {
        numbers.append(Int.random(in: 5..<100))
    }
}

#Preview {
    ContentView()
}
