//
//  ContentView.swift
//  UsingSFSymbols
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var wifiSelecton = 0
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "c")
                Image(systemName: "o")
                Image(systemName: "o")
                Image(systemName: "k")
            }
            .symbolVariant(.fill.circle)
            .foregroundStyle(.yellow, /*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .font(.title)
            
            HStack {
                Image(systemName: "b.circle.fill")
                Image(systemName: "o.circle.fill")
                    .foregroundStyle(.red)
                Image(systemName: "o.circle.fill")
                    .imageScale(.large)
                Image(systemName: "k.circle.fill")
                    .accessibilityIdentifier("Letter K")

            }
            .foregroundStyle(.blue)
            .font(.title)
            .padding()
            
            HStack {
                Image(systemName: "allergens")
                Image(systemName: "ladybug")
            }
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            .font(.largeTitle)
            
            HStack {
                Picker("Pick One", selection: $wifiSelecton) {
                    Text("No Wifi").tag(0)
                    Text("Searching").tag(1)
                    Text("Wifi On").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 240)
                .padding(.horizontal)
                Group {
                    switch wifiSelecton {
                    case 0:
                        Image(systemName: "wifi")
                            .symbolVariant(.slash)
                    case 1:
                        Image(systemName: "wifi")
                            .symbolEffect(.variableColor.iterative.reversing)
                    default:
                        Image(systemName: "wifi")
                            .foregroundStyle(.blue)
                    }
                }
                .foregroundStyle(.secondary)
                .font(.title)
            }
        }
    }
}

#Preview {
    ContentView()
}
