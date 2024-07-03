//
//  ContentView.swift
//  LocalAp
//
//  Created by 차지용 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeColor = false
    @State var message = ""
    
    var placeHolder: LocalizedStringKey = "placeholder-label"
    
    let date = Date()
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        return dateFormatter
    }()
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("greeting-label \(message)"))
            Text("greeting-label \(message)")
            Button("button-label") {
                changeColor.toggle()
            }
            TextField(placeHolder, text: $message)
            Text(date, formatter: dateFormatter)
        }
        .background(changeColor ? Color.red : Color.yellow)
        .padding()
    }
}

#Preview("기본 - 한국어") {
    ContentView()
}

#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}

#Preview("French") {
    ContentView()
        .environment(\.locale, .init(identifier: "fr"))
}

#Preview("Spanish") {
    ContentView()
        .environment(\.locale, .init(identifier: "es"))
}
