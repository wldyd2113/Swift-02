//
//  BlueCircle.swift
//  UsingViewBuilder
//
//  Created by 차지용 on 4/23/24.
//

import SwiftUI
/*
 @ViewBuilder 특성을 사용하여 여러 개의 View를 반환할 수 있는 클로저를 받습니다.
 이 클로저에서 반환된 View는 self.content 속성에 할당되며,
 이를 통해 BlueCircle 구조체의 body 속성에서 사용할 수 있습니다.
 */

struct BlueCircle<Content:View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        HStack {
            content
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 30)
        }
    }
}

