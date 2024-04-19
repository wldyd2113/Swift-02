//
//  FirstTabView.swift
//  LifecycleDemo
//
//  Created by 차지용 on 4/19/24.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggred")
            })
            .onDisappear(perform: {
                print("onDisappear triggred")
            })
    }
}

#Preview {
    FirstTabView()
}
