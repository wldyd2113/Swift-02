//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

//바인딩하는 역활 연결만해주는게 아니라
import SwiftUI

//ObservableObject프로토콜은 해당 클래스의 인스턴스를 감시하고 있다가 값이 변경되면 업데이트 해줌
//@Published :클래스 해당인스턴스를 감시하고 있다
class DemoData: ObservableObject {
    @Published var userCount = 0
//    @Published var cuurentUser = ""
    
//    init() {
//        updateData()
//    }
//    func updateData() {
//        
//    }
    func increment() {
        userCount += 1
    }
}

struct ContentView: View {
    @StateObject var demoData: DemoData = DemoData()
    var body: some View {
        VStack {
            Text(" you are user number \(demoData.userCount)")
            Button(action: {
                demoData.increment()
            }) {
                Text("Incremnet")
                    .font(.largeTitle)
            }
        }
    }
}


#Preview {
    ContentView()
}
