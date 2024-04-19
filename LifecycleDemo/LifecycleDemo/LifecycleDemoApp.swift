//
//  LifecycleDemoApp.swift
//  LifecycleDemo
//
//  Created by 차지용 on 4/19/24.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //window에서 상태변화를 보여줌
        .onChange(of: scenePhase) { (oldScenePharse, newScenePharse) in
            switch newScenePharse {
            case .active:
                print("Active \(oldScenePharse)")
            case .inactive:
                print("Inactive \(oldScenePharse)")
            case .background:
                print("Background")
            default:
                print("Unknown scenephase")
            }
        }
    }
}
