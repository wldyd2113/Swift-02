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
            .onAppear(perform: { //이화면에 왔을때 반응
                print("onAppear triggred")
            })
            .onDisappear(perform: { //다른화면이로 이동했을때 반응
                print("onDisappear triggred")
            })
    }
}

#Preview {
    FirstTabView()
}
