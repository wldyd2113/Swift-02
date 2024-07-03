//
//  ContentView.swift
//  MotionApp
//
//  Created by 차지용 on 7/3/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    
    var body: some View {
        VStack {
            Text("x: \(x)")
            Text("y: \(y)")
            Text("z: \(z)")
        }
        .padding()
        .onAppear {
            motionManager.startAccelerometerUpdates(to: queue) {
                (data: CMAccelerometerData?, error: Error?) in
                guard let data = data else {
                    print("error: \(error!)")
                    return
                }
                
                let trackMotion: CMAcceleration = data.acceleration
                motionManager.accelerometerUpdateInterval = 2.5
                DispatchQueue.main.async {
                    x = trackMotion.x
                    y = trackMotion.y
                    z = trackMotion.z
                }

            }
        }
    }
}

#Preview {
    ContentView()
}
