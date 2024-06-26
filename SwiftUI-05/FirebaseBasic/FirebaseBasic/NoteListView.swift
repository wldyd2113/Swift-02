//
//  NoteListView.swift
//  FirebaseBasic
//
//  Created by 차지용 on 4/30/24.
//

import SwiftUI

import SwiftUI

struct NoteListView: View {
    @State private var service: NoteService = NoteService()
    @State private var isNewNotePresented = false
    
    var body: some View {
        NavigationStack {
            List(service.notes) { note in
                NavigationLink(value: note) {
                    NoteSummaryView(note: note)
                }
            }
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
            .navigationTitle("FireNotes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    isNewNotePresented.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.headline)
                }
            }
            .sheet(isPresented: $isNewNotePresented) {
                AddNoteView(service: service)
            }
            .task {
                service.fetch()
            }
        }
    }
}

#Preview {
    NoteListView()
}
