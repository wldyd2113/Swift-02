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
        VStack{
            myLayout  {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit) //시뮬레이터 크기에 맞춰줌
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit) //시뮬레이터 크기에 맞춰줌
            }
            HStack {
                Button(action: {
                    myLayout = AnyLayout(HStackLayout())
                }) {
                    Text("HStack")
                }
                Button(action: {
                    myLayout = AnyLayout(VStackLayout())
                }) {
                    Text("VStack")
                }
                Button(action: {
                    myLayout = AnyLayout(ZStackLayout())
                }) {
                    Text("ZStack")
                }

            }
        }
    }
}


#Preview {
    ContentView()
}
