//
//  ContentView.swift
//  UsingImages
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.dogs1) //Image("dogs1")
                .resizable()
                .aspectRatio(contentMode: .fit)//화면에 맞춰줌
            Image(.dogAndNature)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:  300, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(.blue, lineWidth: 6))
                .shadow(radius: 10)
            
            Image(uiImage: UIImage(resource: .dog2))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
