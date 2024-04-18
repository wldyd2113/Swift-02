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
            Text("Hello World, how are you?")
                .font(.largeTitle)
                .border(Color.black)
//                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center) //infinity얼마든지 커져봐!
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    ContentView()
}
