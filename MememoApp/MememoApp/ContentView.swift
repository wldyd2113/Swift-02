//
//  ContentView.swift
//  MememoApp
//
//  Created by 차지용 on 4/22/24.
//

import SwiftUI
import Foundation
import SwiftData

@Model
struct Memo {
    var id: UUID = UUID()
    var text: String
    var color: Color
    var created: Date
    
    init(text: String, color: Color, created: Date) {
        self.text = text
        self.color = color
        self.created = created
    }
    var createdString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: created)
    }
}

class MemoStroe: ObservableObject {
    @Published var memos: [Memo] = []
    
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, color: color, created: Date())
    }
    
    func removeMemo(_ targetMemo: Memo) {
        if let index = memos.firstIndex(where: {$0.id == targetMemo.id}) {
            memos.remove(at: index)
        }
    }
}



struct ContentView: View {
    var body: some View {
        VStack {

        }
    }
}

#Preview {
    ContentView()
}
