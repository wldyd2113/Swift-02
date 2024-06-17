//
//  ContentView.swift
//  BookShelf
//
//  Created by 차지용 on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("9781484285718-M")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            VStack(alignment: .leading) {
                Text("Asynchronous Promming with SwiftUI and Combine")
                    .font(.headline)
                Text("by peter Friese")
                    .font(.subheadline)
                Text("451 pages")
                    .font(.subheadline)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
