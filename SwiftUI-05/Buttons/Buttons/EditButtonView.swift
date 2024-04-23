//
//  EditButtonView.swift
//  Buttons
//
//  Created by 차지용 on 4/23/24.
//



import SwiftUI

struct EditButtonView: View {
    @State var animals = ["Cats", "Dogs", "Goats"]
    var body: some View {
        List {
            /*
             animals => 배열(다수)
             animal => 배열의 한 요소(단수)
             맥락상
             */
            ForEach(animals, id: \.self) { animal in
                Text(animal)
            }
            .onDelete(perform: removeAnilmal)
        }
        .toolbar{
            EditButton()
        }
        .navigationTitle("EditButton View")
    }
    func removeAnilmal(at offsets: IndexSet) { //이 함수에서 IndexSet 매개변수는 사용자가 삭제한 항목의 인덱스 집합을 나타냄 IndexSet은 중복되지 않는 인덱스 값의 집합을 나타내는 데이터 구조입니다
        animals.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        EditButtonView()
    }
}
