//
//  ContentView.swift
//  SearchApp
//
//  Created by 차지용 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""

    let petArray = ["Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog"]

    var body: some View {
        NavigationStack {
            PetListView(animals: petArray)
        }
        .searchable(text: $searchText) {
            ForEach(petArray.filter { $0.hasPrefix(searchText)}, id: \.self) { name in
                Text(name)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct PetListView: View {
    let animals: [String]
    var body: some View {
        List(animals, id: \.self) { animal in
            Text(animal)
        }
    }
}
