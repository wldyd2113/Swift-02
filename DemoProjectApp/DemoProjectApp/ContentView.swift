//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

//바인딩하는 역활 연결만해주는게 아니라
import SwiftUI



struct ContentView: View {
    
    func doSomething (){
        print("Start \(Date())")
        Task {
            await takesTooLong()
        }
        print("End \(Date())")
    }
    
    func takesTooLong() async {
        sleep(5)
        print("Async task completed at \(Date())")
    }
    
    
    
    var body: some View {
        VStack {
            Button(action: {
                doSomething()
            }) {
                Text("Do something")
            }
        }
    }
}


#Preview {
    ContentView()
}
