//
//  ContentView.swift
//  ReadWrite
//
//  Created by 차지용 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var createText = ""
    @State var displayText = ""
    var body: some View {
        VStack {
            TextEditor(text: $createText)
            HStack {
                Button(action: {
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.tex")
                    do {
                        try createText.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
                    }
                    catch {
                        print("File writing error")
                    }
                }) {
                    Text("Write File")
                }
                Button(action: {          
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.txt")
                    do {
                        let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
                        displayText = fileContent
                    } catch {
                        print("File reading error")
                    }
                }) {
                    Text("Read File")
                }
            }
            .padding()
            TextEditor(text: $displayText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
