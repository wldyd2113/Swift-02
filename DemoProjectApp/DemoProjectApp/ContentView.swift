//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

//바인딩하는 역활 연결만해주는게 아니라
import SwiftUI

class DemoData: ObservableObject {
    @Published var userCount = 0
    @Published var cuurentUser = ""
    
    init() {
        updateData()
    }
    func updateData() {
        
    }
}

struct ContentView: View {
    @StateObject var demoData: DemoData = DemoData()
    var body: some View {
        VStack {
            Text("\(demoData.cuurentUser), you are user number \(demoData.userCount)")
        }
    }
}


#Preview {
    ContentView()
}
