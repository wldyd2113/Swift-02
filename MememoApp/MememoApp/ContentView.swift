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
    
    //추가
    func addMemo(_ text: String, color: Color) {
        let memo: Memo = Memo(text: text, color: color, created: Date())
    }
    
    //삭제
    func removeMemo(_ targetMemo: Memo) {
        if let index = memos.firstIndex(where: {$0.id == targetMemo.id}) {
            memos.remove(at: index)
        }
    }
}



struct ContentView: View {
    @ObservedObject var memoStore: MemoStroe = MemoStroe()
    
    @State var isSheetShowing: Bool = false
    @State var memoText: String = ""
    @State var memoColor: Color = .blue
    let colors:[Color] = [.blue, .cyan, .purple, .yellow, .indigo]
    
    var body: some View {
        NavigationStack {
            List(memoStore.memos) { memo in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(memo.text)").font(.title)
                        Text("\(memo.createdString)").font(.body).padding(.top)
                    }
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(memo.color)
                .shadow(radius: 3)
                .padding()
                .contextMenu {
                    ShareLink(item: memo.text)
                    Button {
                        memoStore.removeMemo(memo)
                    } label: {
                        Image(systemName: "trash.slash")
                        Text("삭제")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("mememo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {
                        memoText = ""
                        isSheetShowing =  true
                    }
                }
            }
            .sheet(isPresented: $isSheetShowing) {
                MemoAddView()
            }
        }
    }
}

#Preview {
    ContentView()
}
