//
//  ContentView.swift
//  StateMangement
//
//  Created by 차지용 on 6/17/24.
//

import SwiftUI
class Counter: ObservableObject {
    @Published var count = 0
}

struct StateStepper: View {
    @StateObject var stateCounter = Counter()
    var body: some View {
        Section(header: Text("@StateObject")) {
            Stepper("Counter: \(stateCounter.count)", value: $stateCounter.count)
        }
    }
}

struct ContentView: View {
    @State var color: Color = Color.accentColor
    var body: some View {
        VStack(alignment: .leading) {
            StateStepper()
            ColorPicker("Pick a color", selection: $color)
        }
        .foregroundColor(color)
    }
}

#Preview {
    ContentView()
}
