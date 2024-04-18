//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout()) //AnyLayout프로토콜사용
    var body: some View {
        HStack{
            Image(systemName: "airplane")
            Text("Flight times: ")
            Text("London")
        }
        .font(.largeTitle)
        .frame(width: 300)
        .lineLimit(1...4) //라인 제한
        .transaction { transaction in
            transaction.disablesAnimations = true //클로저 문법에서 in을 사용하지 않으면 익명 파라미터로 $0을 사용 ex)(transaction,transaction2) 인경우 $0, $1사용가능
        }
    }
}


#Preview {
    ContentView()
}
