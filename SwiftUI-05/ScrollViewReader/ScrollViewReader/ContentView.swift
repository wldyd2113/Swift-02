//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by 차지용 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    @State private var scrolledId: CharacterInfo.ID?
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("ios 17+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    Button("Go to letter Q") {
                        scrolledId = 16
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                    
                    ForEach(CharacterInfo.charArray) { image in
                        Image(systemName: image.name)
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .frame(width: 90, height: 90)
                            .background(.yellow)
                            .padding()
                    }
                    Button("Go to letter G") {
                        withAnimation {
                            scrolledId = 6
                        }
                    }
                }
                .scrollPosition(id: $scrolledId)
            }
            VStack {
                Text("ios 14+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    ScrollViewReader { proxy in
                        Button("Go to letter Q") {
                            proxy.scrollTo(16)
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                        
                        ForEach(CharacterInfo.charArray) { image in
                            Image(systemName: image.name)
                                .font(.largeTitle)
                                .foregroundStyle(.yellow)
                                .frame(width: 90, height: 90)
                                .background(.blue)
                                .padding()
                        }
                        Button("Go to letter A") {
                            withAnimation {
                                proxy.scrollTo(0, anchor: .top)
                            }
                        }
                        .padding()
                        .background(.yellow)
                        .tint(.blue)
                        
                    }
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
