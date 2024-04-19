//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

//바인딩하는 역활 연결만해주는게 아니라
import SwiftUI


struct ContentView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    var body: some View {
        VStack {
            TextField("Enter user name", text: $userName)
            Text(userName)
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
                .font(.largeTitle)

            WifiImageView(wifiEnabled2: $wifiEnabled)
        }
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled2: Bool
    var body: some View {
        Toggle(isOn: $wifiEnabled2) {
            Text("Enable Wi-Fi")
        }
    }
}
#Preview {
    ContentView()
}
