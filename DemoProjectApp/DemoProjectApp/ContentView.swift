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
        let detachedTask = Task.detached(priority: .background) {
            //            let result = await takesTooLong()
            //            print("Date result: \(result)")
            
            let result = await takesTooLong()
            print("Date result: \(result)")
        }
        if(!detachedTask.isCancelled){
            detachedTask.cancel()
        }
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date {
        print("tasksTooLong starts")
        sleep(5)
        print("tasksTooLong")
        return Date()
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
