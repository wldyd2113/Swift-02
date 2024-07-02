//
//  ContentView.swift
//  PetApp
//
//  Created by 차지용 on 7/2/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let coreDM: CoreDataManager
    
    @State var petName = ""
    @State var petBreed = ""
    @State var petArray = [Animal]()
    
    var body: some View {
        VStack {
            TextField("Enter pet name", text: $petName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter pet breed", text: $petBreed)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Save") {
                coreDM.savePet(name: petName, breed: petBreed)
                
                petName = ""
                petBreed = ""
            }
        }
    }
}

#Preview {
    ContentView(coreDM: CoreDataManager())
}
