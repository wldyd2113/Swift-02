//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled){
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
                .font(.largeTitle)
                .frame(height: 100)
        }
    }
}


#Preview {
    ContentView()
}
