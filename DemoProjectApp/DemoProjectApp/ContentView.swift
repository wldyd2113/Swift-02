//
//  ContentView.swift
//  DemoProjectApp
//
//  Created by 차지용 on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .center){
            GeometryReader { geometry in //$0은 임시변수여서
                //$0 여기서는 쓸수 있는데 다른데서 사용불가
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .border(Color.black)
                //                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
                    .frame(minWidth: 0, maxWidth: geometry.size.width / 2, minHeight: 0, maxHeight: .infinity, alignment: .center) //infinity얼마든지 커져봐!
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    ContentView()
}
