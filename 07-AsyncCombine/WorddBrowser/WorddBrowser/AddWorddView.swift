//
//  AddWorddView.swift
//  WorddBrowser
//
//  Created by 차지용 on 6/24/24.
//

import SwiftUI

struct AddWorddView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var word: String = ""
    
    var onAddWord: (String) -> Void
    var body: some View {
        Form {
            TextField("Word", text: $word)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .navigationTitle("Add New")
        .onSubmit(handleOnAddWord)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        
    }
    
    private func handleOnAddWord() {
        onAddWord(word)
        dismiss()
    }
}

#Preview {
    NavigationStack{
        AddWorddView(onAddWord: { word in
            print(word)
        })
    }
}
