//
//  SecondView.swift
//  PreviewingNavigationStack
//
//  Created by 차지용 on 4/26/24.
//

import SwiftUI

struct SecondView: View {
    var someText: String
    var body: some View {
        Text(someText)
            .navigationTitle("Second View")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview("Second View") {
    SecondView(someText: "This is the view")
}
