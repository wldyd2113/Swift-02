//
//  ContentView.swift
//  Debugging
//
//  Created by Jungman Bae on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var message = "Temparature in celsius"
    let temp = 37.0
    
    
    var body: some View {
        VStack {
            Text(message + "\(temp)")
            Text("Temparature in Fahrenheit: \(C2F(tempC:temp))")
        }
    }
    
    func C2F (tempC: Double) -> Double {
        var tempF: Double
        tempF = (tempC * 9/5) + 32
        return tempF
    }
}

#Preview {
    ContentView()
}
