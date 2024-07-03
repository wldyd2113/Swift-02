//
//  ContentView.swift
//  SearchApp
//
//  Created by 차지용 on 7/3/24.
//

import SwiftUI

enum ProductScope {
    case fruit
    case vegetable
}


struct ContentView: View {
    @State private var scope: ProductScope = .fruit

    @State var searchText = ""
    
    let petArray = ["Cat", "Dog", "Fish", "Donkey", "Canary", "Camel", "Frog"]
        
    var body: some View {
        NavigationStack {
            PetListView(animals: petArray)
                .navigationTitle("SearchApp")
        }
        .navigationBarTitleDisplayMode(.automatic)
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Look for a pet") {
//            Text("Singing").searchCompletion("Canary")
//            Text("Funny").searchCompletion("Canary")
//            Text("Croaking").searchCompletion("Frog")
//            Text("Grumpy").searchCompletion("Cat")
            
            // searchText 가 비었을 경우, hasPrefix는 true 를 리턴
            // 배열의 모든 요소가 출력됨
            ForEach(petArray.filter {  $0.hasPrefix(searchText) }, id: \.self) { name in
                Text(name)
            }
        }
                    .searchScopes($scope) {
                        Text("Fruit").tag(ProductScope.fruit)
                        Text("Vegetable").tag(ProductScope.vegetable)
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
        .listStyle(.plain)
    }
}
