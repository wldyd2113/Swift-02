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
    //Create
    func savePet(name: String, breed: String) {
        let pet = Animal(context: persistentContainer.viewContext)
        pet.name = name
        pet breed = breed
        do {
            try persistentContainer.viewContext.save()
            print("Pet saved!")
        }
        catch {
            print("Failed to save pet \(error)")
        }
    }
    //Read
    func getAllPets() -> [Animal] {
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch {
            return []
        }
    }
    //Delete
    func deletePet(animal: Animal) {
        persistentContainer.viewContext.delete(animal)
        do {
            try persistentContainer.viewContext.save()
            print("Pet saved!")
        }
        catch {
            print("Failed to save context \(error)")
        }
    }
}
