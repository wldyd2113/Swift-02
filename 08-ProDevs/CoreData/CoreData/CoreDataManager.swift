//
//  CoreDataManager.swift
//  CoreData
//
//  Created by 차지용 on 7/2/24.
//

import Foundation
import CoreData

class CoreDataManager {
    let presistentContainer: NSPersistentContainer
    init() {
        presistentContainer = NSPersistentContainer(name: "CoreData")
        presistentContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Core Data failed to initialize \(error.localizedDescription)")
            }
        }
        
    }
}
