//
//  ContentView.swift
//  WorddBrowser
//
//  Created by 차지용 on 6/24/24.
//

import SwiftUI

struct SectionView: View {
    var title: String
    var words: [String]

    init(_ title: String, words: [String]) {
        self.title = title
        self.words = words
    }

    var body: some View {
        Section(title) {
            if words.isEmpty {
                Text("(No items match your filter criteria)")
            } else {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = LibraryViewModel()
    var body: some View {
        List {
            SectionView("Rondom word", words: [viewModel.randomWord])
            SectionView("Peter's Tips", words: viewModel.filteredTips)
            SectionView("My favorites", words: viewModel.favorites)
        }
        .searchable(text: $viewModel.searchText)
        .textInputAutocapitalization(.never)
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button (action:{}){
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
