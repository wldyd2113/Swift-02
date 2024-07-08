//
//  SwiftUIView.swift
//  UIKitCodeonly
//
//  Created by 차지용 on 7/8/24.
//

import SwiftUI

struct SwiftUIView: View {
    let name: String
    var body: some View {
        Text("Hello, \(name)")
    }
}

#Preview {
    SwiftUIView(name: "Jiyong")
}
