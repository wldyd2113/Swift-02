//
//  ContentView.swift
//  ObservableDemo
//
//  Created by 차지용 on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerData: TimerData = TimerData()//옵저버플 프로토콜을 상태를 관리하는 StateObject
    var body: some View {
        NavigationStack{
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink(destination: SecondView(timerData: timerData)){
                    Text("Next Screen")
                }
                .padding()
            }
        }
    }
//    func resetCount() {
//        timerData.resetCount()
//    }
}

#Preview {
    ContentView()
}
