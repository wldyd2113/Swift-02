//
//  ContentView.swift
//  PreviewingWithTraits
//
//  Created by 차지용 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.teal
                .frame(width: 200, height: 150)
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Hello, world!")
                    .font(.title2)
            }
            .foregroundStyle(.primary)
            .padding(.all, 20)
            .background()
            .border(.tertiary, width: 10)
        }
    }
}

#Preview("Portait") {
    ContentView()
}

#Preview("Landscape", traits: .landscapeLeft) {
    ContentView()
}

#Preview("Upside down", traits: .portraitUpsideDown) {
    ContentView()
}

#Preview(" Size that fits", traits: .sizeThatFitsLayout) {
    ContentView()
}

#Preview("Fixed", traits: .fixedLayout(width: 500, height: 200)) {
    ContentView()
}
