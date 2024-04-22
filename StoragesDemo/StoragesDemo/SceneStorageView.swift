//
//  SceneStorageView.swift
//  StoragesDemo
//
//  Created by 차지용 on 4/22/24.
//

import SwiftUI

struct SceneStorageView: View {
    
    @SceneStorage("mytext") private var editorText: String = "" //@SceneStorage():앱이꺼져도 저장하게 해줌
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(38)
            .font(.largeTitle)
    }
}

#Preview {
    SceneStorageView()
}
