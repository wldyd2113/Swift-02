//
//  PasteButtonView.swift
//  Buttons
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI
//복사하기
struct PasteButtonView: View {
    @State var text = ""
    var body: some View {
        VStack {
            PasteButton(payloadType: String.self) { strings in
                guard let string = strings.first else {
                    return
                }
                text = string
            }
            .buttonBorderShape(.capsule)
            .labelStyle(.iconOnly)
            .tint(.red)
        }
        .navigationTitle("PasteButton View")
    }
}

#Preview {
    NavigationStack{
        PasteButtonView()
    }
}
