//
//  NoteService.swift
//  FirebaseBasic
//
//  Created by 차지용 on 4/29/24.
//

import Firebase
import FirebaseFirestore

class NoteService: ObservableObject {
    @Published var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func fetch() {
        
    }
    
    func addNote(title: String, date: Date, body: String) {
        
    }
    
    private func startRealtimeUpdates() {
        
    }
    
    private func updateNotes(snashot: QuerySnapshot) {
        
    }
}
