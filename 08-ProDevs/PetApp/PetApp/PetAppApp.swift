//
//  PetAppApp.swift
//  PetApp
//
//  Created by 차지용 on 7/2/24.
//

import SwiftUI

@main
struct PetAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
