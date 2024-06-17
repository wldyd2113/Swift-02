//
//  ContentView.swift
//  BookShelf
//
//  Created by 차지용 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var books: [Book]
    
    var body: some View {
        List(books, id: \.title) { book in
            HStack(alignment: .top) {
                Image(book.mediumCoverImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 90)
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.headline)
                    Text("by \(book.author)")
                        .font(.subheadline)
                    Text("\(book.pages)")
                        .font(.subheadline)
                    
                }
                Spacer()
            }
        }
        .listStyle(.plain)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView(books: Book.sampleBooks)
}
