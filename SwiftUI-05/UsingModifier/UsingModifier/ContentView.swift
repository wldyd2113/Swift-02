//
//  ContentView.swift
//  UsingModifier
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct BackgroundStyle: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width * 0.3) //bounds: 실측 공간(너비), UIScreen:UIkit에서 가져온 화면 객체
            .foregroundStyle(.black)
            .padding()
            .background(bgColor)
            .cornerRadius(20) //테두리
    }
}
extension View {
    func customBackgroundStyle(color: Color) -> some View {
        modifier(BackgroundStyle(bgColor: color))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Perfect").customBackgroundStyle(color: .green)//.modifier(BackgroundStyle(bgColor: .red))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
