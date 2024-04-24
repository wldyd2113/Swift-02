//
//  ContentView.swift
//  WeScroll
//
//  Created by 차지용 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    let letters = ["a","b","c","d","e","f","g","h",
                   "i","j","k","l","m","n","o","p"]
    
    @State private var flashIndicators = false
    var body: some View {
        VStack {
            ScrollView {
                    ForEach(letters, id:\.self) { letter in
                        Image(systemName: letter)
                            .font(.largeTitle)
                            .foregroundStyle(.yellow)
                            .frame(width: 40, height: 50)
                            .background(.blue)
                            .symbolVariant(.circle.fill)
                }
            }
            .frame(width: 50, height: 200)
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(letters, id:\.self) { letter in
                        Image(systemName: letter)
                            .foregroundStyle(.yellow)
                            .frame(width: 40, height: 50)
                            .background(.blue)
                            .symbolVariant(.circle.fill)
                    }
                }
            }
            .scrollIndicatorsFlash(trigger: flashIndicators) //스크롤 되었다고 알려줌
            .padding()
            Button("Flash") {
                flashIndicators.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
