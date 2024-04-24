//
//  ContentView.swift
//  SearchList
//
//  Created by 차지용 on 4/24/24.
//

import SwiftUI



struct ContentView: View {
    @State var searchText = ""
    let food:[Food] = Food.sampleFood
    
    var serachResults: [Food] {
        if searchText.isEmpty {
            return food
        }
        else {
            return food.filter{
                ($0.name.lowercased().contains(searchText.lowercased()))
            }//filter 고차원함수 true면 실행
        }
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(serachResults, id: \.self) { food in
                    LabeledContent(food.name) {
                        Text("\(food.category.rawValue)")
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Serach for a food")
            .navigationTitle("Food")
            
        }
    }
}

#Preview {
    ContentView()
}
